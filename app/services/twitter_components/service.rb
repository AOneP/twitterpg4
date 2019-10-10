require 'net/http'
module TwitterComponents

  class Service

    def self.client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token        = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end
    end

    def self.public_tweets(query = 'aleppo', counter = 1, opts = {})
      # sort_by bo uuid było zbyt dużą liczbą i przechodzimy na id
      tweets = client.search(query, opts).instance_variable_get(:@collection).sort_by { |t| t.id }
      return tweets if counter.nil?
      tweets.take(counter)
    end
  end
end
