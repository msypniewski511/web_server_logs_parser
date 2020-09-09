

module LoggerParser
  RSpec.describe ReadAndParseData do
    describe '#call' do

      subject(:object) { described_class.new(file_to_read) }

      let(:file_to_read) { File.open(file_path, 'r') }

      context 'when file contain invalid data' do
        let(:expectation) { ['/some_page/1', '123.456.789.012'] }
        let(:file_path) { File.expand_path('../fixtures/invalidlog.log', __dir__) }

        it 'does not print anything' do
          object.call
          expect(List.count).to be_zero
        end
      end

      context 'when file contain valid data' do
        let(:expectation) { ['/some_page/1', '123.456.789.012'] }
        let(:file_path) { File.expand_path('../fixtures/log.log', __dir__) }

        it 'store data' do
          object.call
          expect(List.get(List::ATTRS)).to eq(expectation)
        end
      end
      
    end  
  end
end
