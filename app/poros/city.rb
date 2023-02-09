class City
	attr_reader :city, 
							:country, 
							:country_code, 
							:latitude, 
							:longitude

	def initialize(city_data, country)
		@city = city_data[:name]
		@country = country.capitalize
		@country_code = city_data[:country]
		@latitude = city_data[:latitude]
		@longitude = city_data[:longitude]
	end
end
