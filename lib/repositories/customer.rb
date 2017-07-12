require './lib/data_sources/file'
require './lib/mappers/customer'

module Repositories
  # Implements the behavior of a customers from a specific datasource
  class Customer
    def initialize(data_source = DataSources::File.new)
      @data_source = data_source
    end

    def all
      @all ||= raw_customers_data.map do |attrs|
        Mappers::Customer.new(attrs).customer
      end
    end

    def within_range(reference_location, range)
      all.select do |customer|
        reference_location.distance_to(customer.location) <= range
      end
    end

    private

    def raw_customers_data
      @raw_customers_data ||= @data_source.json_records
    end
  end
end
