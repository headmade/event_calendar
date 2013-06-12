# coding: UTF-8
Configus.build Rails.env do
  env :production do
    website_url 'http://example.com'

    event_attributes [:event_id, :name, :start_date, :start_time, :end_date, :end_time, :venue, :description, :link, :area, :categories, :modified, :recurring, :link_url, :link_name, :ticket_link, :venue_id, :latitude, :longitude, :user_id]
    area_attributes [:area_id, :name, :keyword, :parent, :timezone, :latitude, :longitude, :tzid]
  end

  env :development, parent: :production do
    website_url 'http://event_calendar.dev'
  end

  env :test, parent: :production do
    website_url 'http://example.com'
  end

end