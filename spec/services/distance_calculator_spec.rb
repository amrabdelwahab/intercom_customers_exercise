require 'spec_helper'
require './lib/services/distance_calculator'

describe Services::DistanceCalculator do
  let(:source) { Models::Location.new(-6.2576841, 53.3393) }
  let(:destination) { Models::Location.new(-6.2576841, 53.3393) }

  subject { described_class.new(source, destination) }

  describe '#distance_in_kms' do
    let(:destination) { source }

    context 'when the source and destination are the same' do
      it 'should return 0' do
        expect(subject.distance_in_kms).to eq 0
      end
    end

    context 'when the source and destination are the same' do
      let(:destination) { Models::Location.new(-6.043701, 52.986375) }
      it 'should return the correct distance in kms' do
        expect(subject.distance_in_kms).to eq 41.802589756143966
      end
    end
  end
end
