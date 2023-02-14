class ImageFacade
  def self.get_place_image_ref(address)
    response = GoogleService.find_place(address, 'name,photo')
    hit = response[:candidates].first
    return { name: hit[:name], photo_reference: hit[:photos].first[:photo_reference] } if response[:status] == 'OK'

    { error_message: response[:status] }
  end
end
