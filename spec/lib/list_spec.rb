require_relative '../../lib/list'


module LoggerParser
  RSpec.describe List do

    subject(:list) { described_class.new(path: 'some_page/1', visitor_id: '123.456.789.012') }

    context '#valid?' do
      it 'is valid with valid attributes' do
        expect(list).to be_valid
      end

      it 'is invalid without path' do
        list.path = nil
        expect(list).to_not be_valid
      end

      it 'is invalid without visitor_id' do
        list.visitor_id = nil
        expect(list).to_not be_valid
      end
    end
  

    context '.group_by_path_with_count' do
      subject(:query) do
        described_class.group_by_path_with_count.map(&:values)
      end

      context 'with data' do
        let(:expectation) { [{ count: 3, path: 'a' }, { count: 2, path: 'b' }] }

        before { given_data }
        it { is_expected.to eq(expectation) }
      end

      context 'without data' do
        it { is_expected.to eq([]) }
      end
    end

    context '.group_by_unique_visits' do
      subject(:query) do
        described_class.group_by_unique_visits.map(&:values)
      end

      context 'without data' do
        it { is_expected.to eq([]) }
      end

      context "with data" do
        let(:expectation) { [{ count: 1, path: 'a' }, { count: 2, path: 'b' }] }

        before { given_data }
        it { is_expected.to eq(expectation) }
      end   
    end
  
    private
  
    def given_data
      create(:list, path: 'a', visitor_id: '1')
      create(:list, path: 'a', visitor_id: '1')
      create(:list, path: 'a', visitor_id: '1')
      create(:list, path: 'b', visitor_id: '2')
      create(:list, path: 'b', visitor_id: '3')
    end
  end
end
