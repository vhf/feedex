defmodule FeedEx do
  def parse(feed_bin) do
    :feedparser.parse feed_bin
  end
end
