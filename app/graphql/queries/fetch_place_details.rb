module Queries
  class FetchPlaceDetails < Queries::BaseQuery
    type Types::PlaceType, null: true

    argument :place_id, String, required: true

    def verify_contact(details)
      if details[:contact].present?
        return details[:contact][:phone].presence
      else
        return nil
      end
    end

    def resolve(args)
      details = PlacesFacade.get_detailed_information(args[:place_id])
      image = ImageFacade.get_place_image_url(details[:formatted])
      {"place_id" => args[:place_id],
        "name" => details[:name],
        "city" => details[:city],
        "state" => details[:state],
        "country" => details[:country],
        "phone" => verify_contact(details),
        "website" => details[:website],
        "hours" => details[:opening_hours],
        "categories" => details[:categories],
        "address" => details[:formatted],
        "lat" => details[:lat],
        "lon" => details[:lon],
        "image_data" => image[:photo_reference]
      }
    end
  end
end
