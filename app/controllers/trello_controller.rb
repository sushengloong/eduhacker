class TrelloController < ApplicationController
  @@api_clients = [
    YoutubeClient.new,
    AmazonClient.new
  ]

  def index
  end

  def search
    @results = search_and_cache params[:q]
    respond_to do |format|
      format.js
    end
  end

  private

  def search_and_cache q
    Rails.cache.fetch("search_and_cache/#{q}") do
      @@api_clients.map { |client| client.search q }.flatten
    end
  end
end
