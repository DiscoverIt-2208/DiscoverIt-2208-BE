class AddColumnsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :city, :string
    add_column :favorites, :country, :string
    add_column :favorites, :state, :string
    add_column :favorites, :address, :string
  end
end
