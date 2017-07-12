require 'spec_helper'
require './lib/data_sources/file'

describe DataSources::File do
  let(:lines) do
    []
  end
  let(:reader) { double('reader') }
  before do
    allow(reader)
      .to receive(:lines)
      .and_return(lines)
  end
  subject { described_class.new(reader) }

  describe '#json_records' do
    context 'when the reader returns an empty array' do
      it 'should return an empty array' do
        expect(subject.json_records).to be_a Array
        expect(subject.json_records).to be_empty
      end
    end

    context 'when the reader returns valid json data' do
      let(:lines) do
        [
          '{"attr1": "test", "id": 1}',
          '{"attr1": "test1", "id": 2}',
          '{"attr1": "test2", "id": 3}'

        ]
      end

      it 'should return an array' do
        expect(subject.json_records).to be_a Array
      end

      it 'should return an array with the correct count' do
        expect(subject.json_records.count).to eq 3
      end
    end

    context 'when the reader returns invalid json data' do
      let(:lines) do
        [
          '{"attr "test", "id": 1}',
          '{"attr1": "test1", "id": 2}',
          '{"attr1", "id": 3}'
        ]
      end
      it 'should return an array' do
        expect(subject.json_records).to be_a Array
      end

      it 'should exclude the invalid records' do
        expect(subject.json_records.count).to eq 1
      end

      it 'should print an error message to stdout' do
        expect { subject.json_records }
          .to output(
            "Invalid record was excluded\n"\
            "Invalid record was excluded\n"
          )
          .to_stdout
      end
    end
  end
end
