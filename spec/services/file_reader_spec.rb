require 'spec_helper'
require './lib/services/file_reader'

describe Services::FileReader do
  let(:file_path) { './spec/fixtures/file.json' }
  subject { described_class.new(file_path) }

  describe '#lines' do
    context 'when the file exists' do
      it 'should return an array' do
        expect(subject.lines).to be_a Array
      end

      it 'should return an array with count of 2' do
        expect(subject.lines.count).to eq 3
      end
    end

    context 'when the file does not exist' do
      let(:file_path) { 'wrong file name' }

      it 'should print an error message to stdout' do
        expect { subject.lines }
          .to output(
            "Error while reading file: 'wrong file name',"\
            " Make sure the file exists\n"
          )
          .to_stdout
      end

      it 'should return an empty array' do
        expect(subject.lines).to match_array []
      end
    end
  end
end
