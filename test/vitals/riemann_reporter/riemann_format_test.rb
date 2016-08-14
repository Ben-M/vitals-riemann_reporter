require 'test_helper'

describe Vitals::Formats::RiemannFormat do

  let(:format) { Vitals::Formats::RiemannFormat.new(environment: 'env', facility: 'service', host: 'my-host') }

  it 'normalizes the metric' do
    mock(Vitals::Utils).normalize_metric('metric') { 'normalized_metric' }
    format.format('metric').must_equal('normalized_metric')
  end

  it 'returns "" for ""' do
    format.format('').must_equal('')
  end

  it 'returns "" for nil' do
    format.format(nil).must_equal('')
  end
end

