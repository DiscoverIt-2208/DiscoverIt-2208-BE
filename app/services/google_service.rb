class GoogleService
  def self.find_place(address, fields = '')
    response = conn.get("place/findplacefromtext/json") do |f|
      f.params['fields'] = fields
      f.params['inputtype'] = 'textquery'
      f.params['input'] = address
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_photo_url(reference)
    response = conn.get('place/photo') do |f|
      f.params['photo_reference'] = reference
      f.params['maxwidth'] = 700
    end
    response.headers['location']
  end

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
      f.params['key'] = ENV['google_key']
    end
  end
end
