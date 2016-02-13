defmodule FeedEx do
  @moduledoc """
  This module does nothing but delegate to feedparser.
  """
  def parse(feed_bin) do
    :feedparser.parse feed_bin
  end
end
