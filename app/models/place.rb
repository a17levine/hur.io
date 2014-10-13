class Place < ActiveRecord::Base
  belongs_to :user

  def basic?
  	if self.notes.blank? == true || self.parking_notes.blank? == true
  		return true
  	else
  		return false
  	end
  end

  def google_url
  	return "http://maps.google.com/?q=" + CGI::escape(self.google_query)
  end

  def lat_long
    return "#{self.lat}, #{self.long}"
  end

  def google_map_image
    map = GoogleStaticMap.new(:zoom => 15, :center => MapLocation.new(:address => self.lat_long), :width => 640, :height => 400)
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => self.lat_long))
    # map.get_map
    map.url(:auto)
  end

  protected
  
  def google_query
    if self.google_friendly_name.blank? == true
      return self.lat_long
    else
      return self.google_friendly_name
    end
  end

end
