require './lib/services/distance_calculator'
module Models
  class Location
    attr_reader :longitude, :latitude

    def initialize(longitude, latitude)
      @longitude = longitude
      @latitude = latitude
    end

    def distance_to(destination)
      Services::DistanceCalculator.new(self, destination).distance_in_kms
    end
  end
end
