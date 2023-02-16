module Mutations
    class DeleteUserFavorite < Mutations::BaseMutation
      description "Delete a favorite for a user"
  
      argument :place_id, String, required: true
      argument :user_id, Integer, required: true

      field :success, String, null: true

      def resolve(args)
        favorite = Favorite.find_by(user_id: args[:user_id], place_id: args[:place_id])
        favorite.destroy
           { 
             success: "Favorite has been successfully deleted!"
           } 
      end
    end
  end