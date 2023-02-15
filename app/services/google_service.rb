class GoogleService
  def self.find_place(address, fields = '')
    response = conn.get("place/findplacefromtext/json") do |f|
      f.params['fields'] = fields
      f.params['inputtype'] = 'textquery'
      f.params['input'] = address
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
      f.params['key'] = ENV['google_key']
    end
  end
end
