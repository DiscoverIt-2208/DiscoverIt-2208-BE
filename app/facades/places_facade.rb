class PlacesFacade
  TARGET_FIELDS = {
    geoapify: %i[name address_line1 address_line2 categories place_id lon lat]
  }.freeze

  def self.places(city_info, categories = nil, page = 0)
    geoapify_get_places(city_info, categories, page)
  end

  # PRIVATE METHODS
  #============================================================================

  def self.search_mapper(places, target_fields_key)
    places.map! do |hit|
      hit.select { |key, _value| TARGET_FIELDS[target_fields_key].include?(key) }
    end
  end

  #  Geoapify specific methods:
  #  -------------------------------------------------------------------------

  # Manager method
  def self.geoapify_get_places(city_info, categories, page)
    places = geoapify_populate_results(city_info, categories, page)
    geoapify_filter(places)
  end

  # Populates results until 20 are present. If a search finds <20, it increases the search radius and tries again.
  # Accepts pagination, a page value is multiplied by 20 to get the correct result offset, but also adds the number of
  # past results (if under 20) so results won't be repeated (hopefully).
  def self.geoapify_populate_results(city_info, categories, page)
    places = []
    while places.count < 20
      radius_mult ||= 0
      places.concat(GeoapifyService.get_places(city_info, categories, (page * 20 + places.count),
                                               radius_mult += 1)[:features])
    end
    places.take(20)
  end

  # Flattens hash and holds target fields for a call to the general mapping method. Use of other
  # place DBs in the future will have their own custom method to allow search_mapper to format uniformly
  def self.geoapify_filter(places)
    places.map! do |raw_hit|
      raw_hit[:properties]
    end

    search_mapper(places, :geoapify)
  end

  # END Geoapify methods
  #  -------------------------------------------------------------------------

  private_class_method :geoapify_get_places,
                       :geoapify_populate_results,
                       :search_mapper,
                       :geoapify_filter
end
