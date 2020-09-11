module LoggerParser
  require_relative 'list'

  # Reading file
  class ReadAndParseData
    def initialize(file)
      @file = file
    end

    def call
      read_and_parse_file
      
    end

    private
    attr_reader :file

    def read_and_parse_file
      file.each_line do |line|
        tmp = line.split()
        list = List.new()
        list.path = tmp[0]
        list.visitor_id = tmp[1]
        list.valid? && list.save
      end
    end
  end
end