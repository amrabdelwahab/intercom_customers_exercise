require 'spec_helper'
require './lib/services/file_reader'

describe Services::FileReader do
  let(:file_path) { './spec/fixtures/file.json' }
  subject { described_class.new(file_path) }

  describe '#content_array' do
    context 'when the file exists' do
      it 'should return an array' do
        expect(subject.content_array).to be_a Array
      end

      it 'should return an array with count of 2' do
        expect(subject.content_array.count).to eq 3
      end
    end

    context 'when the file does not exist' do
      let(:file_path) { 'wrong file name' }

      it 'should print an error message to stdout' do
        expect { subject.content_array }
          .to output(
            "Error while reading file: 'wrong file name',"\
            " Make sure the file exists\n"
          )
          .to_stdout
      end

      it 'should return an empty array' do
        expect(subject.content_array).to match_array []
      end
    end
  end

  describe '#json_array' do
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
    end
  end
end
