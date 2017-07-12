require 'spec_helper'
require './lib/repositories/customer'

describe Repositories::Customer do
  subject { described_class.new(data_source) }
  let(:json_data) { [] }
  let(:data_source) { double('data_source', json_records: json_data) }

  describe '#all' do
    context 'when the data_source returns empty array of records' do
      specify { expect(subject.all).to match_array [] }
    end

    context 'when the data_source returns some records' do
      let(:customer_1_hash) do
        {
          'latitude' => '51.92893',
          'user_id' => 1,
          'name' => 'Alice Cahill',
          'longitude' => '-10.27699'
        }
      end

      let(:customer_3_hash) do
        {
          'latitude' => '52.3191841',
          'user_id' => 3,
          'name' => 'Jack Enright',
          'longitude' => '-8.5072391'
        }
      end

      let(:json_data) do
        [customer_1_hash, customer_3_hash]
      end

      let(:results) { subject.all }

      it 'should return an array' do
        expect(results).to be_an Array
      end

      it 'should return all the 3 records' do
        expect(results.count).to eq 2
      end

      it 'should have all the records as customer objects' do
        expect(results).to all be_a Models::Customer
      end
    end

    describe '#within_range' do
      let(:reference_location) { Models::Location.new(-6.2576841, 53.3393) }
      context 'when the data_source returns empty array of records' do
        specify do
          expect(subject.within_range(reference_location, 100))
            .to match_array []
        end
      end

      context 'when the data_source returns some records' do
        let(:customer_1_outside_range) do
          {
            'latitude' => '51.92893',
            'user_id' => 1,
            'name' => 'Alice Cahill',
            'longitude' => '-10.27699'
          }
        end

        let(:customer_within_range) do
          {
            'latitude' => '53.2451022',
            'user_id' => 4,
            'name' => 'Ian Kehoe',
            'longitude' => '-6.238335'
          }
        end

        let(:json_data) do
          [customer_1_outside_range, customer_within_range]
        end

        let(:results) { subject.within_range(reference_location, 100) }

        it 'should return an array' do
          expect(results).to be_an Array
        end

        it 'should return only the customer in range and exclude the rest' do
          expect(results.count).to eq 1
        end

        it 'should return the customer user_id correctly' do
          expect(results.first.user_id).to eq 4
        end

        it 'should return the customer name correctly' do
          expect(results.first.name).to eq 'Ian Kehoe'
        end
      end
    end
  end
end
