require 'spec_helper'
require './lib/data_sources/file'

describe DataSources::File do
  let(:file_path) { './spec/fixtures/file.json' }
  subject { described_class.new(file_path) }

  describe '#json_records' do
    context 'when the file has valid json data' do
      it 'should return an array' do
        expect(subject.json_array).to be_a Array
      end

      it 'should return an array with the correct count' do
        expect(subject.json_array.count).to eq 3
      end
    end

    context 'when the file has invalid json data' do
      let(:file_path) { './spec/fixtures/invalid_file.json' }
      it 'should return an array' do
        expect(subject.json_array).to be_a Array
      end

      it 'should exclude the invalid records' do
        expect(subject.json_array.count).to eq 1
      end

      it 'should print an error message to stdout' do
        expect { subject.json_array }
          .to output(
            "Invalid record was excluded\n"\
            "Invalid record was excluded\n"
          )
          .to_stdout
      end
    end
  end
end
