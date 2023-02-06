class Favorite < ApplicationRecord
  validates_presence_of :ninja_id
  validates_presence_of :place_name
  validates_presence_of :thubnail_url

  belongs_to :user
end