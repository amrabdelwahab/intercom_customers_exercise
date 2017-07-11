require './lib/services/file_reader'
module Repositories
  class Customer
    WHITE_LISTED_PARAMS = %w[user_id name longitude latitude].freeze

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
      Models::Customer.new(permitted_params(attrs))
    end

    def permitted_params(attrs)
      attrs
        .select { |key, _| WHITE_LISTED_PARAMS.include? key }
    end
  end
end
