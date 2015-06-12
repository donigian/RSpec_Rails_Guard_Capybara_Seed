class Location < ActiveRecord::Base
  validates :latitude, :longitude,
            :presence => true,
            :numericality => true
  def create
    Location.create(person_params)
  end

  R = 3_959 # Earth's radius in mi, approx
  def near?(lat, long, mile_radius)
    raise ArgumentError unless mile_radius >= 0
    loc = Location.new(:latitude => lat,:longitude => long)
    R * haversine_distance(loc) <= mile_radius
  end

  private

    def to_radians(degrees)
      degrees * Math::PI / 180
    end

    def haversine_distance(loc)
      dist_lat = to_radians(loc.latitude - self.latitude)
      dist_long = to_radians(loc.longitude - self.longitude)
      lat1 = to_radians(self.latitude)
      lat2 = to_radians(loc.latitude)
      a = Math.sin(dist_lat/2) * Math.sin(dist_lat/2) +Math.sin(dist_long/2) * Math.sin(dist_long/2) *Math.cos(lat1) * Math.cos(lat2)
      2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    end

    def person_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:location).permit(:latitude, :longitude)
    end
end