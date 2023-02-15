class GeoapifyService
  DEFAULT_CATEGORIES = %w[
    accommodation.hotel
    accommodation.hostel
    commercial.art
    commercial.antiques
    catering.restaurant
    catering.cafe
    catering.biergarten
    catering.taproom
    education.library
    entertainment
    heritage
    leisure.park
    natural
    national_park
    tourism.attraction
    tourism.sights
    beach
    building.tourism
    building.historic
    production.winery
    production.brewery
    production.cheese
    production.pottery
  ].freeze

  def self.get_city_places(city_info, categories = nil, offset = 0, radius = 2500)
    categories ||= DEFAULT_CATEGORIES

    response = conn.get("/v2/places") do |f|
      f.params['categories'] = categories.join(',')
      f.params['bias'] = "proximity:#{city_info[:longitude]},#{city_info[:latitude]}"
      f.params['filter'] = "circle:#{city_info[:longitude]},#{city_info[:latitude]},#{radius}"
      f.params['offset'] = offset
      f.params['limit'] = '20'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  # PRIVATE METHODS
  #===============================================================

  def self.conn
    Faraday.new('https://api.geoapify.com') do |f|
      f.params['apiKey'] = ENV['places_api_key']
    end
  end

  private_class_method :conn
end
