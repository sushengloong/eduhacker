class YoutubeClient
  API_KEY = ENV['YOUTUBE_API_KEY']
  API_SERVICE_NAME = 'youtube'
  API_VERSION = 'v3'

  # Note: This uses Public API Access instead of oauth2
  def initialize
    @client = Google::APIClient.new key: API_KEY, authorization: nil
    @youtube = @client.discovered_api API_SERVICE_NAME, API_VERSION
  end

  def search q
    params = {
       q: q,
       part: 'snippet',
       type: 'video',
       maxResults: 10
    }
    api_result = @client.execute api_method: @youtube.search.list, parameters: params
    JSON.parse(api_result.response.body)['items'].map do |item|
      Result.new item['snippet']['title'],
        "http://www.youtube.com/watch?v=#{item["id"]["videoId"]}",
        item['snippet']['thumbnails']['default']['url']
    end
  end
end
