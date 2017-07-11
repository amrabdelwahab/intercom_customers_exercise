require 'spec_helper'
require './lib/services/file_reader'

describe Services::FileReader do
  let(:file_path) { './spec/fixtures/file.json' }
  subject { described_class.new(file_path) }
  describe '#read_content' do
    context 'when the file exists' do
      it 'should return an array' do
        expect(subject.read_content).to be_a Array
      end
    end

    context 'when the file does not exist' do
      let(:file_path) { 'wrong file name' }
      it 'should return an array' do
        expect { subject.read_content }
          .to output(
            "Error while reading file: 'wrong file name',"\
            " Make sure the file exists\n"
          )
          .to_stdout
      end
    end
  end
end
