module Models
  class Location
    attr_reader :longitude, :latitude

    def initialize(longitude, latitude)
      @longitude = longitude
      @latitude = latitude
    end

    def distance_to(destination)
      0
    end
  end
end
