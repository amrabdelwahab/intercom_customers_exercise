require 'spec_helper'
require './lib/models/customer'

describe Models::Customer do
  let(:attrs) do
    {
      latitude: '52.986375',
      user_id: 12,
      name: 'Christina McArdle',
      longitude: '-6.043701'
    }
  end
  subject { described_class.new(attrs) }

  describe '#initialize' do
    specify { expect(subject.user_id).to eq 12 }
    specify { expect(subject.name).to eq 'Christina McArdle' }
    specify { expect(subject.location).to be_a Models::Location }
  end
end
