require "vitals/riemann_reporter/version"

require 'riemann/client'
require_relative 'riemann_reporter/riemann_format'
require 'vitals'

module Vitals::Reporters
  class RiemannReporter < BaseReporter
    attr_accessor :format
    attr_reader :riemann

    def initialize(host: 'localhost', port: 5555, timeout: 5, format: nil, facility: nil, environment: nil)
      @riemann = Riemann::Client.new(host: host, port: port, timeout: timeout)
      @format = format
      @facility = facility
      @environment = environment
    end

    def inc(m)
      emit(format.format(m), 1, 'counter')
    end

    def gauge(m, v)
      emit(format.format(m), v, 'gauge')
    end

    def timing(m, v)
      emit(format.format(m), v, 'timer')
    end

    private
    def emit(m, v, type)
      @riemann << {
        service: m,
        metric: v,
        time: Time.now.to_i,
        tags: ['vitals', type],
        facility: @facility,
        environment: @environment
      }
    end
  end
end


