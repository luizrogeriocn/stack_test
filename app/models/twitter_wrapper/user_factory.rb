module TwitterWrapper
  class UserFactory
    def self.build_user(*args)
      new(*args).build_user
    end

    def initialize(screen_name)
      @screen_name = screen_name
    end

    def build_user
      TwitterWrapper::User.new(user: fetch_user, tweets: fetch_tweets)
    rescue Twitter::Error::Unauthorized
      TwitterWrapper::User.new(user: fetch_user, tweets: [])
    rescue Twitter::Error::NotFound, Twitter::Error::Forbidden
      TwitterWrapper::NullUser.new(screen_name)
    end

    private
    attr_reader :screen_name

    def fetch_user
      @user_from_twitter ||= twitter_wrapper.user(screen_name)
    end

    def twitter_wrapper
      @twitter_wrapper ||= TwitterWrapper::Api.new(TwitterWrapper::Client.build)
    end

    def fetch_tweets
      @tweets_from_twitter ||= twitter_wrapper.user_timeline(screen_name)
    end
  end
end
