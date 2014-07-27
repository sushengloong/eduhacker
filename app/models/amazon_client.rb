class AmazonClient
  ACCESS_KEY_ID = ENV['AMAZON_ACCESS_KEY_ID']
  SECRET_ACCESS_KEY = ENV['AMAZON_SECRET_ACCESS_KEY']
  ASSOCIATE_TAG = 'tag'

  # Note: This uses Public API Access instead of oauth2
  def initialize
    @client = Vacuum.new
    @client.configure(
      aws_access_key_id:     ACCESS_KEY_ID,
      aws_secret_access_key: SECRET_ACCESS_KEY,
      associate_tag:         ASSOCIATE_TAG
    )
  end

  def search q
    params = {
      'SearchIndex' => 'Books',
      'ResponseGroup' => 'ItemAttributes,Images',
      'Keywords' => q
    }
    resp = @client.item_search(query: params).to_h

    resp["ItemSearchResponse"]["Items"]["Item"].map do |item|
      Result.new item["ItemAttributes"]["Title"],
        item["DetailPageURL"] ,
        item["SmallImage"]["URL"]
    end
  end
end
