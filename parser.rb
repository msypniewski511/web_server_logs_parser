# frozen_string_literal: true

require_relative 'lib/main_parser'

LoggerParser::MainParser.new(ARGV[0]).call
