defmodule FeedExTest do
  use ExUnit.Case

  @sample_rss "test/sample-rss-2.xml"
  @sample_atom "test/sample-atom-1.xml"

  test "parsing RSS" do
    feed = File.read! @sample_rss
    {:ok, feed} = FeedEx.parse(feed)
    assert feed[:feed][:title] == 'Liftoff News'
  end

  test "parsing atom" do
    feed = File.read! @sample_atom
    {:ok, feed} = FeedEx.parse(feed)
    assert feed[:feed][:title] == 'Some Awesome Blog'

    {:url, url} = hd (for e <- feed[:feed][:links], e[:rel] == 'hub' do {:url, e[:href]} end)
    assert url == 'https://example.com/?pushpress=hub'
  end
end
