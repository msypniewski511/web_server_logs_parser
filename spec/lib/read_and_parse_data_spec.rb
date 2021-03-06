# frozen_string_literal: true

module LoggerParser
  RSpec.describe ReadAndParseData do
    describe '#call' do
<<<<<<< HEAD
      subject(:object) { described_class.new(file_to_read) }

=======
      subject(:object) { described_class.new(orm_model, file_to_read) }

      let(:orm_model) { List }
>>>>>>> refactoring
      let(:file_to_read) { File.open(file_path, 'r') }

      context 'when file contain invalid data' do
        let(:file_path) { File.expand_path('../fixtures/invalidlog.log', __dir__) }

        it 'does not print anything' do
          object.call
          expect(orm_model.count).to be_zero
        end

        # Add expectation of storing invalid data
      end

      context 'when file contain valid data' do
        let(:expectation) { ['/some_page/1', '123.456.789.012'] }
        let(:file_path) { File.expand_path('../fixtures/log.log', __dir__) }

        it 'store data' do
          object.call
          expect([orm_model.last.path, orm_model.last.visitor_id]).to eq(expectation)
          # expect(orm_model.count).to eq(1)
        end
      end
    end
  end
end
