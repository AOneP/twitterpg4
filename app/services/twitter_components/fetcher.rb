module TwitterComponents
  class Fetcher
    def self.first_fetch
      Service.public_tweets('aleppo', 100, result_type: 'recent').each do |tweet|
        Tweet.create(
          nickname: tweet.user.name,
          text: tweet.text,
          full_text: tweet.full_text,
          uuid: tweet.id,
          url: tweet.url.to_str,
          tweet_time: tweet.created_at,
        )
      end
    end

    def self.fetch
      Service.public_tweets('aleppo', nil, since_id: Tweet.last.uuid).each do |tweet|
        Tweet.find_or_create_by(
          nickname: tweet.user.name,
          text: tweet.text,
          uuid: tweet.id,
          url: tweet.url.to_str,
          tweet_time: tweet.created_at,
        )
      end
    end
  end
end
