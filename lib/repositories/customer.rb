require './lib/services/file_reader'
module Repositories
  class Customer
    def initialize(data_source)
      @data_source = data_source
    end

    def all
      @all ||= raw_customers_data.map do |record_attrs|
        map_customer(record_attrs)
      end
    end

    private

    def raw_customers_data
      @raw_customers_data ||= @data_source.json_data
    end

    def map_customer(attrs)
      Mappers::Customer.new(attrs).customer
    end
  end
end
