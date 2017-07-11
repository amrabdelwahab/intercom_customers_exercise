require './lib/data_sources/file'
require './lib/mappers/customer'
module Repositories
  class Customer
    def initialize(data_source = DataSources::File.new)
      @data_source = data_source
    end

    def all
      @all ||= raw_customers_data.map do |record_attrs|
        map_customer(record_attrs)
      end
    end

    private

    def raw_customers_data
      @raw_customers_data ||= @data_source.json_records
    end

    def map_customer(attrs)
      Mappers::Customer.new(attrs).customer
    end
  end
end
