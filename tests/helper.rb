## Initialize credentials
ENV['FOG_RC'] = ENV['FOG_RC'] || File.expand_path('../.fog', __FILE__)

## From fog-core
require 'minitest/autorun'
require "minitest/spec"
require 'fog/test_helpers'
require 'fog/hadoop'
require "simplecov"
require 'coveralls'

SimpleCov.start
Coveralls.wear!
if ENV['FOG_MOCK'] == 'true'
  Fog.mock!
end

if Fog.mock?
  Fog.credentials = {
    hadoop_compute_api_url: 'http://localhost:8088',
    hadoop_storage_api_url: 'http://localhost:50070'
  }.merge(Fog.credentials)
end

def hadoop_compute_service
  Fog::Compute[:hadoop]
end

def hadoop_storage_service
  Fog::Storage[:hadoop]
end

