require 'test_helper'

class Feedkit::Parser::XMLFeedTest < Minitest::Test

  def test_feed_details
    url = "http://www.example.com/atom.xml"
    stub_request_file("atom.xml", url)
    request = ::Feedkit::Request.new(url: url)
    result = ::Feedkit::Parser::XMLFeed.new(request.body, request)

    assert_equal "Feedbin", result.title
    assert_equal ["http://pubsubhubbub.superfeedr.com/"], result.hubs
    assert_equal "https://feedbin.com/blog/atom.xml", result.self_url
    assert_equal "https://feedbin.com", result.site_url
    assert_equal 5, result.entries.count
  end

end