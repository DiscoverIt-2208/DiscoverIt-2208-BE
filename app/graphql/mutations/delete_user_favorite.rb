module Mutations
    class DeleteUserFavorite < Mutations::BaseMutation
      description "Delete a favorite for a user"
  
      argument :id, Integer, required: true

      field :success, String, null: true

      def resolve(args)
        favorite = Favorite.find(args[:id])
        favorite.destroy
           { 
             success: "Favorite has been successfully deleted!"
           } 
      end
    end
  end