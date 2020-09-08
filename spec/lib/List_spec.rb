require_relative '../../lib/list'


module LoggerParser
  RSpec.describe List do
    describe '#call' do

      subject(:list) { described_class.new(args) }

      context 'when no arguments provided' do
        let(:expectation) { "Please provide a file location to get the webserver log report.\n" }
        let(:args) { [] }
        include_examples 'Output test', 'prompts about filepath'
      end
      
      context 'when invalid filepath provided' do
        let(:expectation) { "Could not open the file abc. Please verify the file location.\n" }
        let(:args) { ['abc'] }
        include_examples 'Output test', 'prompts about invalid filepath'
      end
  
      context 'when valid filepath provided' do
        let(:expectation) { "/some_page/1 1\n\n/some_page/1 1\n\n" }
        let(:file) { instance_double(File) }
        let(:args) { [File.expand_path('../fixtures/log.log', __dir__)] }
  
        include_examples 'Output test', 'reads the file'
      end
    end  
  end
end
