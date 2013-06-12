class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area_id
      t.string :name
      t.string :keyword
      t.string :parent
      t.string :timezone
      t.string :latitude
      t.string :longitude
      t.string :tzid

      t.timestamps
    end
  end
end
