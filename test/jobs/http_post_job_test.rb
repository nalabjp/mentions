require 'net/http'

class HttpPostJobTest < ActiveJob::TestCase
  def test_perform
    uri = 'http://example.com'
    params = {}
    Net::HTTP.expects(:post_form).with(URI.parse(uri), params)
    HttpPostJob.perform_now(uri, params)
  end
end
