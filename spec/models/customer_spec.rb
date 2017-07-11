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

  describe '#<=>' do
    context 'when two customers have the same user_id' do
      let(:customer1) { described_class.new(user_id: 12) }
      let(:customer2) { described_class.new(user_id: 12) }

      it 'should equate the two customers' do
        expect(customer1).to eq customer2
      end
    end

    context 'when two customers have different user_id' do
      let(:customer1) { described_class.new(user_id: 1) }
      let(:customer2) { described_class.new(user_id: 12) }

      it 'should evaluate </> than of the customers based on the user_id' do
        expect(customer1 < customer2).to be_truthy
      end
    end

    context 'when you have an array of customers' do
      let(:customer1) { described_class.new(user_id: 1) }
      let(:customer2) { described_class.new(user_id: 10) }
      let(:customer3) { described_class.new(user_id: 20) }
      let(:customers) { [customer2, customer1, customer3] }

      it 'should sort an array of customers based on user_id using #sort' do
        expect(customers).to eq [customer2, customer1, customer3]
        expect(customers.sort).to eq [customer1, customer2, customer3]
      end
    end
  end
end
