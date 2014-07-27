class TrelloController < ApplicationController
  @@youtube_client = YoutubeClient.new

  def index
  end

  def search
    search_response = Rails.cache.fetch("trello/search?q=#{params[:q]}") do
      @@youtube_client.search_video params[:q]
    end
    @results = search_response['items'].map{ |item| item['snippet'] }
    respond_to do |format|
      format.js
    end
  end
end
