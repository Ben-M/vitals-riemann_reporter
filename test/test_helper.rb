$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'vitals/riemann_reporter'

require 'minitest/autorun'
require 'rr'

class TestFormat
  def format(args)
    args
  end
end

def freeze_time_at(epoch)
  Time.stub(:now, Time.at(epoch)) do
    yield
  end
end