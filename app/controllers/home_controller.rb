class HomeController < ApplicationController
  def index
    @user = user
  end

  private

  def twitter_wrapper
    @twitter_wrapper ||= TwitterWrapper::Api.new(TwitterWrapper::Client.build)
  end

  def user
    Rails.cache.fetch("user_#{user_params}", expires_in: TwitterWrapper::Api::CACHE_EXPIRACY.call) do
      TwitterWrapper::User.new(user: tweets.first.user, tweets: tweets)
    end
  end

  def tweets
    @tweets ||= twitter_wrapper.user_timeline(user_params)
  end

  def user_params
    params[:screen_name].sub(/^@/, '')
  end
end
