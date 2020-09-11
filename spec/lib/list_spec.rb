# frozen_string_literal: true

require_relative '../../lib/list'

module LoggerParser
  RSpec.describe List do
    subject(:list) { described_class.new(path: 'some_page/1', visitor_id: '123.456.789.012') }

    describe '#valid?' do
      it 'is valid with valid attributes' do
        described_class.create(path: 'a', visitor_id: '5')
        expect(list).to be_valid
      end

      it 'is invalid without path' do
        list.path = nil
        expect(list).not_to be_valid
      end

      it 'is invalid without visitor_id' do
        list.visitor_id = nil
        expect(list).not_to be_valid
      end
    end

    describe '.group_by_path_with_count' do
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

    describe '.group_by_unique_visits' do
      subject(:query) do
        described_class.group_by_unique_visits.map(&:values)
      end

      context 'without data' do
        it { is_expected.to eq([]) }
      end

      context 'with data' do
        let(:expectation) { [{ count: 2, path: 'b' }, { count: 1, path: 'a' }] }

        before { given_data }

        it { is_expected.to eq(expectation) }
      end
    end

    private

    def given_data
      List.create(path: 'a', visitor_id: '1')
      List.create(path: 'a', visitor_id: '1')
      List.create(path: 'a', visitor_id: '1')
      List.create(path: 'b', visitor_id: '2')
      List.create(path: 'b', visitor_id: '3')
    end
  end
end
