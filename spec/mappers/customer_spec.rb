require 'spec_helper'
require './lib/mappers/customer'

describe Mappers::Customer do
  let(:attrs) do
  end
  subject { described_class.new(attrs) }

  describe '#customer' do
    context 'when valid customer data is passed' do
      specify { expect(subject.customer).to be_a Models::Customer }

      it 'should map the customer basic attributes correctly' do
        expect(subject.customer.user_id).to eq 1
        expect(subject.customer.name).to eq 'Christina McArdle'
      end
    end
  end
end
