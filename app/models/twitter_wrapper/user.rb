module TwitterWrapper
  class User
    extend Forwardable
    attr_reader :tweets

    DELEGATE_METHODS = [
      :screen_name,
      :followers_count,
      :favourites_count,
      :tweets_count,
      :profile_image_url,
      :profile_banner_url
    ]

    delegate DELEGATE_METHODS => :user

    def initialize(user:, tweets:)
      @user = user
      @tweets = map_tweets(tweets)
    end

    def description
      return 'No description' unless user.description.present?
      user.description
    end

    def profile_image
      profile_image_url.to_s.sub("_normal", "")
    end

    def profile_banner
      profile_banner_url ? big_banner : no_banner
    end

    private

    def big_banner
      profile_banner_url.to_s.sub("_normal", "")
    end

    def no_banner
      "http://publishersconvention.com/wp-content/uploads/2014/12/colorful-triangles-background-800x300.jpg"
    end

    private
    attr_reader :user

    def map_tweets(tweets)
      tweets.map{ |t| TwitterWrapper::Tweet.new(t) }
    end
  end
end
