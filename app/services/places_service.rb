class PlacesService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com', params: { apiKey: ENV['places_api_key']})
  end

  def self.get_hotels(city)
    response = conn.get("v2/places?categories=accommodation.hotel&filter=circle:#{city.longitude},#{city.latitude},20000")
    parse = JSON.parse(response.body, symbolize_names: true)[:features]
  end
end
