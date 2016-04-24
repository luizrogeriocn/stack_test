module TwitterWrapper
  class Tweet
    include Virtus.model

    def initialize(tweet)
      @tweet = tweet
      @message = tweet.text.dup
    end

    def created_at
      tweet.created_at
    end

    def id
      tweet.id
    end

    def text
      TwitterWrapper::MessageParser.parse(message)
    end

    private

    attr_reader :tweet, :message
  end
end
