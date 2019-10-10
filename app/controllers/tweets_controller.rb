class TweetsController < ApplicationController
  def index
    @tweets = Tweet.search(params[:search]).order(tweet_time: :desc).page(params[:page])
  end
end
