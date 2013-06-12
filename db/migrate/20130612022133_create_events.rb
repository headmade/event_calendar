class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_id
      t.string :name
      t.string :start_date
      t.string :start_time
      t.string :end_date
      t.string :end_time
      t.string :venue
      t.text :description
      t.string :link
      t.string :area
      t.string :categories
      t.string :modified
      t.string :recurring
      t.string :link_url
      t.string :link_name
      t.string :ticket_link
      t.string :venue_id
      t.string :latitude
      t.string :longitude
      t.string :user_id

      t.integer :area_id

      t.timestamps
    end
  end
end