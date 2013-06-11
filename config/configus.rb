# coding: UTF-8
Configus.build Rails.env do
  env :production do
    website_url 'http://example.com'
  end

  env :development, parent: :production do
    website_url 'http://event_calendar.dev'
  end

  env :test, parent: :production do
    website_url 'http://example.com'
  end

end
