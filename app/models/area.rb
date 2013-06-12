class Area < ActiveRecord::Base
  attr_accessible :area_id, :name, :keyword, :parent, :timezone, :latitude, :longitude, :tzid
end
