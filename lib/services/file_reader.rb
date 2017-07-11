module Services
  class FileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def read_content
      File.readlines(@file_path)
    end
  end
end
