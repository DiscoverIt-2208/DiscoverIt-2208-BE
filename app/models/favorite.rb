class Favorite < ApplicationRecord
  validates_presence_of :place_id
  validates_presence_of :place_name
  validates_presence_of :thumbnail_url, allow_blank: true
  validates_presence_of :state, allow_blank: true
  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :address

  belongs_to :user
end
