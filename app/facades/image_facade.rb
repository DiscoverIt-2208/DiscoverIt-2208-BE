class ImageFacade
  def self.get_place_image_url(address)
    response = GoogleService.find_place(address, 'name,photo')
    return { error_message: response[:status] } if response[:status] != 'OK'
    return { error_message: 'NO_PHOTOS' } if response[:candidates] == [] || !response[:candidates][0][:photos].present?

    hit = response[:candidates].first

    { name: hit[:name], photo_reference: GoogleService.get_photo_url(hit[:photos].first[:photo_reference]) }
  end
end
