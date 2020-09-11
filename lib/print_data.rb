# frozen_string_literal: true

module LoggerParser
<<<<<<< HEAD
  require_relative 'read_and_parse_data'
  # Entry point for given arguments and control flow.
  class PrintData
    def initialize(argv = {})
      @model_klass = argv[:model_klass] || 'LoggerParser::List'
      @invalid_entries = argv[:invalid_entries] || nil
=======
  # Entry point for given arguments and control flow.
  class PrintData
    def initialize(args)
      @model_klass = args[:model_klass] || 'LoggerParser::List'
      @invalid_entries = args[:invalid_entries] || nil
>>>>>>> refactoring
    end

    def call
      show_results
    end

    private

    attr_reader :model_klass, :invalid_entries
<<<<<<< HEAD
    def print_data
      return if model_klass.all.count.zero?

      model_klass.group_by_path_with_count.each do |element|
        puts "#{element.path} #{element[:count]}\n"
      end
=======

    def show_results
      # class knows another class and its methods call but we depent on one incected class
      return if model_klass.all.count.zero? && !invalid_entries

      cos(model_klass.group_by_path_with_count)
>>>>>>> refactoring
      puts "\n"
      cos(model_klass.group_by_unique_visits)
      invalid_entries&.each { |element| print_invalid element }
    end

<<<<<<< HEAD
    def printuj(element)
=======
    def cos(elements)
      elements.each { |element| print_data element }
    end

    def print_invalid(element)
      puts "\nError: '#{element[0]}' in line: '#{element[1]}'\n\n"
    end

    def print_data(element)
>>>>>>> refactoring
      puts "#{element[:path]} #{element[:count]}\n"
    end
  end
end
