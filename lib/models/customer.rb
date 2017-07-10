require './lib/models/location'
module Models
  class Customer
    attr_reader :user_id, :name, :location

    def initialize(attrs)
      @user_id = attrs[:user_id]
      @name = attrs[:name]
      @location = Location.new(attrs[:longitude], attrs[:latitude])
    end
  end
end
