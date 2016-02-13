FeedEx
========
[![Build Status](https://travis-ci.org/vhf/feedex.svg?branch=master)](https://travis-ci.org/vhf/feedex)

Simple wrapper for https://github.com/urbanserj/feedparser

## Usage

```
iex> HTTPoison.start
iex> {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get("http://www.rssboard.org/files/sample-rss-2.xml")
iex> {:ok, feed} = FeedEx.parse(body)
...
iex> feed[:feed][:title]
"Liftoff News"
```
