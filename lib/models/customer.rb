module Models
  class Customer
    attr_reader :user_id, :name

    def initialize(attrs)
      @user_id = attrs[:user_id]
      @name = attrs[:name]
    end
  end
end
