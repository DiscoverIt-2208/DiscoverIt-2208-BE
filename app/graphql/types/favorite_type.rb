module Types
  class FavoriteType < Types::BaseObject
    description 'A favorite place'

    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :ninja_id, String, null: false
    field :place_name, String, null: false
    field :thumbnail_url, String, null: false
    field :city, String, null: false
    field :country, String, null: false
    field :state, String, null: true
    field :address, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end