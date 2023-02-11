class Hotel
  attr_reader :name,
              :address,
              :place_id

  def initialize(data)
    @name = data[:properties][:name]
    @address = data[:properties][:formatted]
    @place_id = data[:properties][:place_id]
  end
end