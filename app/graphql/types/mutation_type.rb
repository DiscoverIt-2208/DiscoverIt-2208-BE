module Types
  class MutationType < Types::BaseObject
    field :create_user_favorite, mutation: Mutations::CreateUserFavorite, null: true
  end
end
