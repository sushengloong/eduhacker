require 'open-uri'

class RedditClient
  def search q
    resp = JSON.parse open( URI.escape("http://www.reddit.com/search.json?q=#{q}&limit=10") ).read
    resp["data"]["children"].map do |item|
      data = item["data"]
      # cannot find thumbnail link from the API so we use Reddit open source thumbnail
      Result.new data["title"], data["url"], "http://www.redditstatic.com/about/opensource.png"
    end
  end
end
