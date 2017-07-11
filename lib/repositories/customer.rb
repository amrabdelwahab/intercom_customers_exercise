module Repositories
  class Customer
    def initialize(source = './data/customers.json')
      @source = source
    end

    def all
      @all ||= []
    end
  end
end
