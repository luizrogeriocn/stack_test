module TwitterWrapper
  class Api
    TWEETS_COUNT = 25

    delegate :user, to: :@client

    def initialize(client)
      @client = client
    end

    def user_timeline(screen_name)
      @client.user_timeline(screen_name, count: TWEETS_COUNT)
    end
  end
end
