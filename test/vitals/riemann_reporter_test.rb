require 'test_helper'

describe Vitals::Reporters::RiemannReporter do

  let(:reporter){ Vitals::Reporters::RiemannReporter.new(host: 'localhost', port: 5555, format: TestFormat.new, facility: 'my-service', environment: 'env') }
  let(:epoch_now){ 12345 }

  it 'should set up riemann' do
    skip("implement")
  end

  it '#inc' do
    freeze_time_at(epoch_now) do
      event = {:service=>"1.2", :metric=>1, :time=>epoch_now, :tags=>["vitals", "counter"], :facility=>'my-service', :environment=>'env'}
      mock(reporter.riemann).<<(event).times(1)
      reporter.inc('1.2')
    end
  end
  
  it '#count' do
    freeze_time_at(epoch_now) do
      event = {:service=>"1.2", :metric=>8, :time=>epoch_now, :tags=>["vitals", "counter"], :facility=>'my-service', :environment=>'env'}
      mock(reporter.riemann).<<(event).times(1)
      reporter.count('1.2', 8)
    end
  end

  it '#timing' do
    freeze_time_at(epoch_now) do
      event = {:service=>"1.2", :metric=>43, :time=>epoch_now, :tags=>["vitals", "timer"], :facility=>'my-service', :environment=>'env'}
      mock(reporter.riemann).<<(event).times(1)
      reporter.timing('1.2', 43)
    end
  end

  it '#gauge' do
    freeze_time_at(epoch_now) do
      event = {:service=>"1.2", :metric=>32, :time=>epoch_now, :tags=>["vitals", "gauge"], :facility=>'my-service', :environment=>'env'}
      mock(reporter.riemann).<<(event).times(1)
      reporter.gauge('1.2', 32)
    end
  end

end

