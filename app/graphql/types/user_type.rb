module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :email, String, null: true
    field :password, String, null: true
    field :favorites, [Types::FavoriteType], null:true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def favorites
      object.favorites
    end
  end
end