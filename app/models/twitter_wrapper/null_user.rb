module TwitterWrapper
  class NullUser
    def initialize(screen_name)
      @screen_name = screen_name
    end

    def default_text
      "The user '#{@screen_name}'' does not exist."
    end

    def any_count
      0
    end

    def profile_banner
      "http://publishersconvention.com/wp-content/uploads/2014/12/colorful-triangles-background-800x300.jpg"
    end

    def profile_image
      "https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png"
    end

    def tweets
      [TwitterWrapper::NullTweet.new(@screen_name)]
    end

    alias_method :screen_name, :default_text
    alias_method :description, :default_text
    alias_method :tweets_count, :any_count
    alias_method :followers_count, :any_count
    alias_method :favourites_count, :any_count
  end
end
