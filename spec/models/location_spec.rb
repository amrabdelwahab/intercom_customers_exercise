require 'spec_helper'
require './lib/models/location'

describe Models::Location do
  let(:longitude) { -6.043701 }
  let(:latitude) { 52.986375 }
  subject { described_class.new(longitude, latitude) }

  describe '#distance_to' do
    context 'when calculating distance to itself' do
      specify { expect(subject.distance_to(subject)).to eq 0 }
    end

    context 'when calculating distance to another location' do
      let(:destination) { described_class.new(-6.2576841, 53.3393) }

      specify do
        expect(subject.distance_to(destination)).to eq 41.802589756143966
      end
    end
  end

  describe '#longitude_in_radians' do
    specify { expect(subject.longitude_in_radians).to eq(-0.10548248145607382) }
  end

  describe '#latitude_in_radians' do
    specify { expect(subject.latitude_in_radians).to eq 0.9247867024464104 }
  end
end
