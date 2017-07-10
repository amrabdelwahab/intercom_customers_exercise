module Models
  class Location
    attr_reader :longitude, :latitude

    def initialize(longitude, latitude)
      @longitude = longitude
      @latitude = latitude
    end
  end
end
