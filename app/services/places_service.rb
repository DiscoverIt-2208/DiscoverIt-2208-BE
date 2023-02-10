class PlacesService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com', params: { apiKey: ENV['places_api_key']})
  end

  # default_categories = string

  def self.get_hotels(city_info)
    response = conn.get("v2/places?categories=accommodation.hotel&filter=circle:#{city_info.longitude},#{city_info.latitude},20000&limit=20&offset=0")
    parse = JSON.parse(response.body, symbolize_names: true)[:features]
  end
end
