class HomeController < ApplicationController
  respond_to :html, :json
  before_filter :user

  def index
    respond_with(@user)
  end

  private

  def twitter_wrapper
    @twitter_wrapper ||= TwitterWrapper::Api.new(TwitterWrapper::Client.build)
  end

  def user
    @user = Rails.cache.fetch("user_#{user_params}", expires_in: TwitterWrapper::Api::CACHE_EXPIRACY.call) do
      begin
        TwitterWrapper::User.new(user: fetch_user, tweets: fetch_tweets)
      rescue Twitter::Error::Unauthorized
        TwitterWrapper::User.new(user: fetch_user, tweets: [])
      rescue Twitter::Error::NotFound
        TwitterWrapper::NullUser.new(user_params)
      end
    end
  end

  def fetch_tweets
    @tweets_from_twitter ||= twitter_wrapper.user_timeline(user_params)
  end

  def fetch_user
    @user_from_twitter ||= twitter_wrapper.user(user_params)
  end

  def user_params
    (params[:screen_name] || "stackcommerce").sub(/^@/, '')
  end
end
