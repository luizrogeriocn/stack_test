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
        TwitterWrapper::User.new(user: tweets.first.user, tweets: tweets)
      rescue Twitter::Error::NotFound
        TwitterWrapper::NullUser.new(user_params)
      end
    end
  end

  def tweets
    @tweets ||= twitter_wrapper.user_timeline(user_params)
  end

  def user_params
    (params[:screen_name] || "stackcommerce").sub(/^@/, '')
  end
end
