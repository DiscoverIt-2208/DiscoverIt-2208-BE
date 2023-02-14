module Mutations
    class DeleteUserFavorite < Mutations::BaseMutation
      description "Delete a favorite for a user"
  
      argument :id, Integer, required: true

      field :success, String, null: true
      field :error, String, null: true
  

      def resolve(args)
        if favorite = Favorite.find(args[:id])
            favorite.destroy
              { 
                success: "#{args[:place_name]} has been successfully deleted!"
              } 
        else
              {
                error: "#{args[:place_name]} is not in favorites!"
              }
        end
      end
    end
  end