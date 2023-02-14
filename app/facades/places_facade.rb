class PlacesFacade
  # Target field arrays for each API. As place APIs are addedin the future,
  # they will have their own hash element to allow target_field_filter to format uniformly
  TARGET_FIELDS = {
    geoapify_fields: %i[name address_line1 address_line2 categories place_id lon lat]
  }.freeze

  def self.places(city_info, categories = nil, page = 0, search_radius = 2500)
    geoapify_get_places(city_info, categories, page, search_radius)
  end

  # PRIVATE METHODS
  #============================================================================

  def self.target_field_filter(properties, target_fields_key)
    properties.map do |hit|
      hit.select { |key, _value| TARGET_FIELDS[target_fields_key].include?(key) }
    end
  end

  #  Geoapify specific methods:
  #  -------------------------------------------------------------------------

  # Manager method. The symbol :geoapify_fields is stored in TARGET_FIELDS on line 4
  def self.geoapify_get_places(city_info, categories, page, search_radius)
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
