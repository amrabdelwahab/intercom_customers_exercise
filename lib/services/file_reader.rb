module Services
  class FileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def read_content
      guarded_file_operation do
        File.readlines(@file_path)
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
