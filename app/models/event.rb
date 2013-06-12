class Event < ActiveRecord::Base
  attr_accessible :event_id, :name
  attr_accessible :start_date, :start_time, :end_date, :end_time
  attr_accessible :venue, :description, :link, :area, :categories, :modified, :recurring
  attr_accessible :link_url, :link_name, :ticket_link, :venue_id, :latitude, :longitude, :user_id

  def self.build_from_hash(hash)

  end
end