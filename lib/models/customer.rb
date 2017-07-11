require './lib/models/location'
module Models
  class Customer
    include Comparable
    attr_reader :user_id, :name, :location

    def initialize(user_id, name, location)
      @user_id = user_id
      @name = name
      @location = location
    end

    def <=>(other)
      user_id <=> other.user_id
    end
  end
end
