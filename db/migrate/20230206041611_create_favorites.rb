class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.string :ninja_id
      t.string :place_name
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
