module TwitterWrapper
  class Tweet
    include Virtus.model

    def initialize(tweet)
      @tweet = tweet
    end

    def created_at
      original_tweet.created_at
    end

    def id
      original_tweet.id
    end

    def profile_image
      original_tweet.user.profile_image_url.to_s.sub("_normal", "")
    end

    def author
      original_tweet.user.screen_name
    end

    def retweeted?
      tweet.retweet?
    end

    def text
      TwitterWrapper::MessageParser.parse(message)
    end

    private

    def message
      original_tweet.text.dup
    end

    def original_tweet
      @original_tweet ||= @tweet.retweet? ? @tweet.retweeted_tweet : tweet
    end

    attr_reader :tweet
  end
end
