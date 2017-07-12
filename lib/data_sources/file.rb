require './lib/services/file_reader'

module DataSources
  # Implements the file datasource behavior given a file reader
  class File
    def initialize(reader = Services::FileReader.new('./data/customers.json'))
      @reader = reader
    end

    def json_records
      @json_records ||= @reader.lines.map do |line|
        guarded_json_operation do
          JSON.parse line
        end
      end.compact
    end

    private

    def guarded_json_operation
      yield
    rescue JSON::ParserError
      puts 'Invalid record was excluded'
      nil
    end
  end
end
