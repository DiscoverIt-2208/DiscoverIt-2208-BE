module Mutations
  class CreateUserFavorite < Mutations::BaseMutation
    description "Create a favorite for a user"

    argument :user_id, Integer, required: true
    argument :place_id, String, required: true
    argument :place_name, String, required: true
    argument :thumbnail_url, String, required: true
    argument :city, String, required: true
    argument :state, String, required: false
    argument :country, String, required: true
    argument :address, String, required: true

    field :success, String, null: true
    field :error, String, null: true


    def resolve(args)
      if Favorite.find_by(user_id: args[:user_id],
            place_id: args[:place_id],
            place_name: args[:place_name],
            thumbnail_url: args[:thumbnail_url],
            city: args[:city],
            state: args[:state],
            country: args[:country],
            address: args[:address]
            )
            { 
              error: "#{args[:place_name]} is already in favorites!"
            } 
      else
        User.find(args[:user_id]).favorites.create(
            place_id: args[:place_id],
            place_name: args[:place_name],
            thumbnail_url: args[:thumbnail_url],
            city: args[:city],
            state: args[:state],
            country: args[:country],
            address: args[:address]
            )

            {
              success: "#{args[:place_name]} has been added to favorites!"
            }
      end
    end
  end
end