require 'spec_helper'
require './lib/models/customer'

describe Models::Customer do
  let(:attrs) { {} }
  subject { described_class.new(attrs) }

  describe '#initialize' do
    let(:attrs) do
      {
        latitude: '52.986375',
        user_id: 12,
        name: 'Christina McArdle',
        longitude: '-6.043701'
      }
    end

    specify { expect(subject.user_id).to eq 12 }
    specify { expect(subject.name).to eq 'Christina McArdle' }
  end
end
