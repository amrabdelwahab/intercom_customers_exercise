require './lib/models/customer'
require './lib/models/location'
module Mappers
  class Customer
    attr_reader :source_hash

    def initialize(source_hash)
      @source_hash = source_hash
    end

    def customer
      @customer ||= Models::Customer.new(user_id, name, location)
    end

    private

    def user_id
      source_hash['user_id']
    end

    def name
      source_hash['name']
    end

    def location
      Models::Location.new(longitude, latitude)
    end

    def longitude
      source_hash['longitude']
    end

    def latitude
      source_hash['latitude']
    end
  end
end
