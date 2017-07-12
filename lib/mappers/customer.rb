require './lib/models/customer'
require './lib/models/location'

module Mappers
  # Responsible for mapping customer raw attributes to our object structure
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
      source_hash['longitude'].to_f
    end

    def latitude
      source_hash['latitude'].to_f
    end
  end
end
