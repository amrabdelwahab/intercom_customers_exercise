require 'spec_helper'
require './lib/repositories/customer'

describe Repositories::Customer do
  subject { described_class.new(data_source) }
  let(:json_data) { [] }
  let(:data_source) { double('data_source') }
  before do
    allow(data_source)
      .to receive(:json_records)
      .and_return(json_data)
  end

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

      let(:customer_2_hash) do
        {
          'latitude' => '51.8856167',
          'user_id' => 2,
          'name' => 'Ian McArdle',
          'longitude' => '-10.4240951'
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
        [customer_1_hash, customer_2_hash, customer_3_hash]
      end

      specify { expect(subject.all).to be_an Array }
      specify { expect(subject.all.count).to eq 3 }
      specify { expect(subject.all).to all be_a Models::Customer }
    end

    describe '#within_range' do
      let(:reference_location) { Models::Location.new(53.3393, -6.2576841)}
      context 'when the data_source returns empty array of records' do
        specify do
          expect(subject.within_range(reference_location, 100))
            .to match_array []
        end
      end
    end
  end
end
