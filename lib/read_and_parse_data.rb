# frozen_string_literal: true
<<<<<<< HEAD

module LoggerParser
  require_relative 'list'
=======
>>>>>>> refactoring

module LoggerParser
  # Reading file from log and if valid save.
  class ReadAndParseData
    def initialize(model_klass, file)
      @file = file
      @list = model_klass
    end

    def call
      read_and_parse_file
    end

    private

<<<<<<< HEAD
    attr_reader :file

    def read_and_parse_file
      file.each_line do |line|
        tmp = line.split
        list = List.new
        list.path = tmp[0]
        list.visitor_id = tmp[1]
=======
    attr_reader :file, :list

    def read_and_parse_file
      file.each_line do |line|
        list = parse_list(line.split)
>>>>>>> refactoring
        list.valid? && list.save
      end
    end

    def parse_list(tmp)
      List.new(path: tmp[0], visitor_id: tmp[1])
    end
  end
end
