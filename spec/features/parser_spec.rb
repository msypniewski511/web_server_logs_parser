module LoggerParser
  RSpec.describe 'parser' do

    # helper function to run command by system
    def support_function(command, expectation)
      expect do  
        system(command)
      end.to output(expectation).to_stdout_from_any_process
    end

    context "when no arguments provided" do
      expectation = "Please provide a file location to get the webserver log report.\n"
      it { support_function('ruby parser.rb', expectation) }
      'returns information about invalid filepath'
    end

    context 'when invalid filepath provided' do
      file_path = 'wrong_filepath'
      expectation = "Could not open the file #{file_path}. Please verify the file location.\n"
      it { support_function("ruby parser.rb #{file_path}", expectation) }
    end

    context 'when valid filepath provided' do
      # pending 'core functionality to implement'
      file_path = File.expand_path('../fixtures/log.log', __dir__)
      expectation = "/some_page/1 1\n\n/some_page/1 1\n"
      it { support_function("ruby parser.rb #{file_path}", expectation) }
    end
  end
end