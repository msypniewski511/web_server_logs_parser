module LoggerParser
  RSpec.describe 'parser' do
    context 'recives a log as argument' do

      # helper function to run command by system
      def support_function(command, expectation)
        expect do  
          system(command)
        end.to output(expectation).to_stdout_from_any_process
      end

      it "when no arguments provided" do
        expectation = "Please provide a file location to get the webserver log report.\n"
        support_function('ruby parser.rb', expectation)
      end

      it 'when invalid filepath provided' do
        file_path = 'wrong_filepath'
        expectation = "Could not open the file #{file_path}. Please verify the file location.\n"
        support_function("ruby parser.rb #{file_path}", expectation)
      end

      it 'when valid filepath provided' do
        pending 'core functionality to implement'
        file_path = File.expand_path('../fixtures/log.log', __dir__)
        expectation = "/some_page/1 1\n\n/some_page/1 1\n\n"
        support_function("ruby parser.rb #{file_path}", expectation)
      end
    end
  end
end