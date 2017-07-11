require './lib/services/file_reader'
module Repositories
  class Customer
    def initialize(source = './data/customers.json')
      @source = source
    end

    def all
      @all ||= raw_customers_data.map do |record_attrs|
        map_customer(record_attrs)
      end
    end

    private

    def raw_customers_data
      @raw_customers_data ||= Services::FileReader.new(@source).json_array
    end

    def map_customer(attrs)
      Mappers::Customer.new(attrs).customer
    end
  end
end
