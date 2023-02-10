module Types
  class FavoriteType < Types::BaseObject
    description 'A favorite place'

    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :ninja_id, String
    field :place_name, String
    field :thumbnail_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end