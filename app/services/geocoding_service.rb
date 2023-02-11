class GeocodingService
  def self.city_info(city,country)
    response = conn.get("/v1/geocoding?city=#{city}&country=#{country}")
    JSON.parse(response.body,symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.api-ninjas.com") do |f|
      f.headers["X-Api-Key"] = ENV['api_ninja_key']
    end
  end
end