module TwitterWrapper
  class Api
    TWEETS_COUNT = 25
    CACHE_EXPIRACY = lambda { 5.minutes }

    def initialize(client)
      @client = client
    end

    def user_timeline(screen_name)
      @client.user_timeline(screen_name, count: TWEETS_COUNT)
    end

    def user(screen_name)
      @client.user(screen_name)
    end
  end
end
