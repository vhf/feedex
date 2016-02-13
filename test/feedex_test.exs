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

    sub_url = feed[:feed][:links]
              |> Enum.find(fn(x) -> x[:rel] == 'hub' end)
              |> Keyword.get(:href)
    assert sub_url == 'https://example.com/?pushpress=hub'
  end
end
