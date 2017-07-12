require 'json'

module Services
  # Responsible for reading a file content from a file path
  class FileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def lines
      guarded_file_operation do
        @lines ||= File.readlines(@file_path)
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
