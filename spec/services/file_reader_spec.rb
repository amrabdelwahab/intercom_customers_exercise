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
  end
end
