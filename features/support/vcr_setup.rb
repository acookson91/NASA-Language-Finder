require 'vcr'
VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = 'features/vcr_cassettes'
  c.hook_into :webmock
end
