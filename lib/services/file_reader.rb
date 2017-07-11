require 'json'

module Services
  class FileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def content_array
      guarded_file_operation do
        @content_array ||= File.readlines(@file_path)
      end
    end

    def json_array
      @json_array ||= content_array.map do |line|
        guarded_json_operation do
          JSON.parse line
        end
      end.compact
    end

    private

    def guarded_file_operation
      yield
    rescue Errno::ENOENT
      puts "Error while reading file: '#{@file_path}',"\
           ' Make sure the file exists'
      []
    end

    def guarded_json_operation
      yield
    rescue JSON::ParserError
      puts 'Invalid record was excluded'
      nil
    end
  end
end
