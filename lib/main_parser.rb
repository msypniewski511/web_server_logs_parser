# frozen_string_literal: true

module LoggerParser
  require_relative 'read_and_parse_data'
  require_relative 'list'
  require_relative 'print_data'
  # Entry point for given arguments and control flow.
  class MainParser
    def initialize(argv = [])
      @argv = argv
    end

    def call
      if argv.nil?
        puts 'Please provide a file location to get the webserver log report.'
      elsif !File.exist?(argv)
        puts "Could not open the file #{argv}. Please verify the file location."
      else
        ReadAndParseData.new(List, open_file).call
        PrintData.new(model_klass: List).call
      end
    rescue Errno::ENOENT
      puts "Could not open the file #{argv}. Please verify the file location."
    end

    private

    attr_reader :argv

    def open_file
      File.open(argv, 'r')
    end
  end
end
