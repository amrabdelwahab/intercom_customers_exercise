module Services
  # Responsible for calculating distance between two locations
  class DistanceCalculator
    attr_reader :source, :destination

    EARTH_RADIUS = 6378.137

    def initialize(source, destination)
      @source = source
      @destination = destination
    end

    def distance_in_kms
      @distance_in_kms ||= EARTH_RADIUS * central_angle
    end

    private

    def central_angle
      Math.acos(
        product_of_sin_latitudes + (product_of_cos_latitudes * Math.cos(delta_longitudes))
      )
    end

    def product_of_sin_latitudes
      Math.sin(source.latitude_in_radians) * Math.sin(destination.latitude_in_radians)
    end

    def product_of_cos_latitudes
      Math.cos(source.latitude_in_radians) * Math.cos(destination.latitude_in_radians)
    end

    def delta_longitudes
      (source.longitude_in_radians - destination.longitude_in_radians).abs
    end
  end
end
