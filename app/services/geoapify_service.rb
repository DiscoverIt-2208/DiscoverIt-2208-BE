class GeoapifyService
  def self.get_places(city_info, categories = nil, offset = 0, radius_mult = 1)
    categories ||= default_categories

    response = conn.get("/v2/places") do |f|
      f.params['categories'] = categories.join(', ')
      f.params['bias'] = "proximity:#{city_info[:longitude]},#{city_info[:latitude]}"
      # Fix this hack later, just speeds up the app. It expands the radius as you go
      f.params['filter'] = "circle:#{city_info[:longitude]},#{city_info[:latitude]},#{2500 * radius_mult}"
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

  def self.default_categories
    %w[
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
    ]
  end

  private_class_method :default_categories, :conn
end
