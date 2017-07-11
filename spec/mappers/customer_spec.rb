require 'spec_helper'
require './lib/mappers/customer'

describe Mappers::Customer do
  let(:attrs) do
    {
      'user_id' => 1,
      'name' => 'Christina McArdle',
      'longitude' => '-6.043701',
      'latitude' => '52.986375'
    }
  end
  subject { described_class.new(attrs) }

  describe '#customer' do
    context 'when valid customer data is passed' do
      specify { expect(subject.customer).to be_a Models::Customer }

      it 'should map the customer basic attributes correctly' do
        expect(subject.customer.user_id).to eq 1
        expect(subject.customer.name).to eq 'Christina McArdle'
      end

      it 'should map the customer location attributes correctly' do
        expect(subject.customer.location).to be_a Models::Location
        expect(subject.customer.location.longitude).to eq '-6.043701'
        expect(subject.customer.location.latitude).to eq '52.986375'
      end
    end
  end
end
