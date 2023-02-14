module Mutations
  class CreateUserFavorite < Mutations::BaseMutation
    description "Create a favorite for a user"

    argument :user_id, Integer, required: true
    argument :ninja_id, String, required: true
    argument :place_name, String, required: true
    argument :thumbnail_url, String, required: false
    # argument :city, String, required: true
    # argument :state, String, required: false
    # argument :country, String, required: true

    field :success, String, null: false
    field :errors, [String], null: false

    def resolve(args)
      return  { error: "#{args[:place_name]} is already in favorites!"} if Favorite.find_by(place_name: args[:place_name], user_id: args[:user_id], ninja_id: args[:ninja_id])
      Favorite.create(
        user_id: args[:user_id],
        ninja_id: args[:ninja_id],
        place_name: args[:place_name],
        thumbnail_url: args[:thumbnail_url],
        # city: args[:city],
        # # state: args[:state],
        # country: args[:country]
        )

        {
        success: "#{args[:place_name]} has been added to favorites!",
        }
    end
  end
end