module LoggerParser
  require_relative 'list'

  # Reading file
  class ReadAndParseData
    def initialize(file)
      @file = file
    end

    def call
      read_and_parse_file
      print_data
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

    def print_data
      List.group_by_path_with_count.map do |element|
        puts "#{element.path} #{element[:count]}\n"
      end
      puts "\n"
      List.group_by_unique_visits.map do |element|
        puts "#{element.path} #{element[:count]}\n"
      end
    end
  end
end