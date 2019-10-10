namespace :twitter_components do
  desc 'Fetch Tweets'
  task fetch_tweets: :environment do
    Rails.logger.info "Start: #{Time.now}"
    if Tweet.first.present?
      Rails.logger.info "Fetch: #{Time.now}"
      TwitterComponents::Fetcher.fetch
    else
      Rails.logger.info "First_Fetch: #{Time.now}"
      TwitterComponents::Fetcher.first_fetch
    end
    Rails.logger.info "End: #{Time.now}"
  end
end
