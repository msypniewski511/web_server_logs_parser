# frozen_string_literal: true

require_relative '../../lib/print_data'
require_relative '../../lib/list'

module LoggerParser
  RSpec.describe PrintData do
    describe '#call' do
      subject(:object) { described_class.new(args) }
      let(:orm_klass) { LoggerParser::List }

      context 'when there are data to display' do
        let(:entries) { [{ path: '/some_page/1', count: '1' }] }
        let(:invalid_entries) { [%w[foo error]] }
        let(:args) { { model_klass: orm_klass, invalid_entries: invalid_entries } }
        let(:expectation) do
          %(/some_page/1 1\n\n/some_page/1 1\n\nError: 'foo' in line: 'error'\n\n)
        end
        let(:ledger) { class_double(LoggerParser::List) }
        before do
          %i[group_by_path_with_count group_by_unique_visits].each do |method|
            allow(LoggerParser::List).to receive(method).and_return(entries)
          end
        end

        include_examples 'Output test', 'prints data'
      end

      context 'when no records' do
        let(:expectation) { '' }
        let(:args) { { model_klass: orm_klass} }
        include_examples 'Output test', 'print nothing'
      end
    end
  end
end
