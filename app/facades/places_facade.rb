class PlacesFacade
  # Target field arrays for each API. As place APIs are addedin the future,
  # they will have their own hash element to allow target_field_filter to format uniformly
  TARGET_FIELDS = {
    geoapify_fields: %i[name formatted categories place_id lon lat image_data],
    google_api_fields: %i[name formatted categories place_id lon lat image_data next_page_token]
  }.freeze

  def self.places(city_info, categories: nil, page_token: nil, search_type: "google", search_radius: 2500)
    if search_type == "geoapify"
      geoapify_get_places(city_info, categories, search_radius)
    else
      google_get_places(city_info, categories, page_token)
    end
  end

  def self.get_detailed_information(id, source: 'google')
    if source == 'geoapify'
      details = GeoapifyService.get_place_details(id)
      details[:features][0][:properties]
    else
      GoogleService.get_place_details(id)
    end
  end

  # PRIVATE METHODS
  #============================================================================

  def self.target_field_filter(properties, target_fields_key)
    properties.map do |hit|
      hit.select { |key, _value| TARGET_FIELDS[target_fields_key].include?(key) }
    end
  end


  #  Google specific methods:
  #  -------------------------------------------------------------------------
  def self.google_get_places(city_info, categories, page_token)
    response = GoogleService.get_city_places(city_info, categories, page_token)
    results = google_results_formatter(response[:results], response[:next_page_token])
    target_field_filter(results, :google_api_fields)
  end

  def self.google_results_formatter(raw_hits, next_page_token)
    raw_hits.map do |raw_hit|
      raw_hit[:formatted] = "#{raw_hit[:name]}, #{raw_hit[:formatted_address]}"
      raw_hit[:categories] = raw_hit[:types]
      raw_hit[:next_page_token] = next_page_token
      raw_hit[:lon] = raw_hit[:geometry][:location][:lng]
      raw_hit[:lat] = raw_hit[:geometry][:location][:lat]
      if raw_hit[:photos].present? && raw_hit[:photos][0].present? && raw_hit[:photos][0][:photo_reference].present?
        photo_url = GoogleService.get_photo_url(raw_hit[:photos][0][:photo_reference])
      end
      raw_hit[:image_data] = { name: raw_hit[:name], photo_reference: photo_url.presence || 'NO_PHOTOS' }
      raw_hit
    end
  end

  #  Geoapify specific methods:
  #  -------------------------------------------------------------------------

  # Manager method. The symbol :geoapify_fields is stored in TARGET_FIELDS on line 4
  def self.geoapify_get_places(city_info, categories, page = 0, search_radius)
    raw_hits = geoapify_populate_results(city_info, categories, page, search_radius)
    properties = geoapify_flattener(raw_hits)
    target_field_filter(properties, :geoapify_fields)
  end

  # Populates results. If less than 20, FE will need to query with a bigger radius if thay want more results
  def self.geoapify_populate_results(city_info, categories, page, search_radius)
    raw_hits = []
    geoapify_response = GeoapifyService.get_city_places(city_info, categories, (page * 20), search_radius)
    raw_hits.concat(geoapify_response[:features]) if geoapify_response[:features].presence
  end

  # Flattens geoapify responses specifically
  def self.geoapify_flattener(raw_hits)
    raw_hits.map do |raw_hit|
      raw_hit[:properties][:image_data] = ImageFacade.get_place_image_url(raw_hit[:properties][:formatted])
      raw_hit[:properties]
    end
  end

  # END Geoapify methods
  #  -------------------------------------------------------------------------

  private_class_method :geoapify_get_places,
                       :geoapify_populate_results,
                       :target_field_filter,
                       :geoapify_flattener
end
