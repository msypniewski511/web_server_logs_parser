module LoggerParser
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
      # TODO
      puts "/some_page/1 1\n\n/some_page/1 1\n\n"
    end
  end
end