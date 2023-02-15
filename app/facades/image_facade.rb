class ImageFacade
  def self.get_place_image_ref(address)
    response = GoogleService.find_place(address, 'name,photo')
    # binding.pry if response[:candidates][0][:photos] == nil
    return { error_message: response[:status] } if response[:status] != 'OK'
    return { error_message: 'NO_PHOTOS' } if response[:candidates] == [] || !response[:candidates][0][:photos].present?

    hit = response[:candidates].first

    return { name: hit[:name], photo_reference: hit[:photos].first[:photo_reference] } if response[:status] == 'OK'
  end
end
