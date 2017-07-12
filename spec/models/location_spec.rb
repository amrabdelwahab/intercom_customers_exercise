require 'spec_helper'
require './lib/models/location'

describe Models::Location do
  let(:longitude) { -6.043701 }
  let(:latitude) { 52.986375 }
  subject { described_class.new(longitude, latitude) }

  describe '#initialize' do
    specify { expect(subject.longitude).to eq(-6.043701) }
    specify { expect(subject.latitude).to eq 52.986375 }
  end
end
