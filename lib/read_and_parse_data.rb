# frozen_string_literal: true

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

    attr_reader :file, :list

    def read_and_parse_file
      file.each_line do |line|
        list = parse_list(line.split)
        list.valid? && list.save
      end
    end

    def parse_list(tmp)
      List.new(path: tmp[0], visitor_id: tmp[1])
    end
  end
end
