module Types
  class MutationType < Types::BaseObject
    field :create_user_favorite, mutation: Mutations::CreateUserFavorite, null: true
    field :delete_user_favorite, mutation: Mutations::DeleteUserFavorite, null: true
  end
end
