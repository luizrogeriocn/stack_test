module TwitterWrapper
  class Client
    attr_reader :client

    def self.build(options = {})
      new(options).client
    end

    def initialize(options = {})
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = options.fetch(:consumer_key, ENV['TWITTER_CONSUMER_KEY'])
        config.consumer_secret     = options.fetch(:consumer_secret, ENV['TWITTER_CONSUMER_SECRET'])
        config.access_token        = options.fetch(:access_token, ENV['TWITTER_ACCESS_TOKEN'])
        config.access_token_secret = options.fetch(:access_token_secret, ENV['TWITTER_ACCESS_TOKEN_SECRET'])
      end
    end
  end
end
