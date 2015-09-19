class Place < ActiveRecord::Base
  belongs_to :user
  has_attached_file :main_photo, styles: { original: "600x600>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :main_photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :main_photo, matches: [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, attributes: :main_photo, less_than: 2.megabytes

  validates :unit_number, length: { maximum: 15 }
  validates :google_friendly_name, :formatted_address, :name, length: { maximum: 100 }
  validates :name, :google_friendly_name, :formatted_address, :lat, :long, presence: true
  validates :notes, :parking_notes, length: { maximum: 500 }

  # Alias actions and validators
  before_validation :tidy_up_alias
  validates :alias, format: { with: /\A[a-z\d]*\Z/i, message: "only allows letters and numbers" }
  validates :alias, length: { minimum: 4, maximum: 20 }
  validates :alias, uniqueness: true


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

  private

  def tidy_up_alias
    self.alias = self.alias.downcase.gsub(" ","")
    true
  end

end
