# frozen_string_literal: true

module LoggerParser
  require_relative 'read_and_parse_data'
  # Entry point for given arguments and control flow.
  class PrintData
    def initialize(argv = {})
      @model_klass = argv[:model_klass] || 'LoggerParser::List'
      @invalid_entries = argv[:invalid_entries] || nil
    end

    def call
      if invalid_entries
        List.group_by_path_with_count.each do |e|
          printuj e
        end
        puts
        model_klass.group_by_unique_visits.each do |element|
          printuj element
        end
        puts
        puts "Error: '#{invalid_entries[0][0]}' in line: '#{invalid_entries[0][1]}'\n\n"
      else
        print_data
      end
    end

    private

    attr_reader :model_klass, :invalid_entries
    def print_data
      return if model_klass.all.count.zero?

      model_klass.group_by_path_with_count.each do |element|
        puts "#{element.path} #{element[:count]}\n"
      end
      puts "\n"
      model_klass.group_by_unique_visits.each do |element|
        puts "#{element.path} #{element[:count]}\n"
      end
    end

    def printuj(element)
      puts "#{element[:path]} #{element[:count]}\n"
    end
  end
end
