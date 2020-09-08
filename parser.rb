class MainParser
  attr_reader :argv
  def initialize(argv = [])
    @argv = argv
  end

  def open_file
    # File.open('webserver.log', 'r')
  end
end

if ARGV.empty?
  puts 'Please provide a file location to get the webserver log report.'
elsif !File.exist?(ARGV[0])
  puts "Could not open the file #{ARGV[0]}. Please verify the file location."
else
  MainParser.new(ARGV[0]).open_file
end