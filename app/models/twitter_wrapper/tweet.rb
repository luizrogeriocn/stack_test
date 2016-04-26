module TwitterWrapper
  class Tweet
    extend Forwardable
    def_delegator :@tweet, :created_at
    def_delegator :@tweet, :id
    def_delegator :@tweet, :user
    def_delegator :@tweet, :retweet?
    def_delegator :@tweet, :text

    def initialize(tweet)
      @tweet = tweet
    end

    def big_profile_image
      original_tweet.user.profile_image_url.to_s.sub("_normal", "")
    end

    def author
      original_tweet.user.screen_name
    end

    # WARNING: Use DI
    def message
      TwitterWrapper::MessageParser.parse(text)
    end

    private
    attr_reader :tweet

    def original_tweet
      @original_tweet ||= @tweet.retweet? ? @tweet.retweeted_tweet : tweet
    end
  end
end
