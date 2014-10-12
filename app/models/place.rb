class Place < ActiveRecord::Base
  belongs_to :user

  def basic?
  	if self.notes.blank? == true
  		return true
  	else
  		return false
  	end
  end

  def google_url
  	base_url = "http://maps.google.com/?q="
  	if self.google_friendly_name.blank? == true
  		escaped_google_friendly_name = CGI::escape(self.lat_long)
  	else
  		escaped_google_friendly_name = CGI::escape(self.google_friendly_name)
  	end
  	return base_url + escaped_google_friendly_name
  end
end
