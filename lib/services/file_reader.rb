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
      content_array.map do |line|
        JSON.parse line
      end
    end

    private

    def guarded_file_operation
      yield
    rescue Errno::ENOENT
      puts "Error while reading file: '#{@file_path}',"\
           ' Make sure the file exists'
      []
    end
  end
end
