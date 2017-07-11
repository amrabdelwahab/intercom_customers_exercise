require 'spec_helper'
require './lib/repositories/customer'

describe Repositories::Customer do
  subject { described_class.new }
  let(:json_data) { [] }
  before do
    allow_any_instance_of(Services::FileReader)
      .to receive(:json_array)
      .and_return(json_data)
  end

  describe '#all' do
    context 'when the file has no valid records' do
      specify { expect(subject.all).to match_array [] }
    end
  end
end
