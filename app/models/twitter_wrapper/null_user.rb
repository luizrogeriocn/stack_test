module TwitterWrapper
  class NullUser
    def initialize(screen_name)
      @screen_name = screen_name
    end

    def description
      "The user '#{@screen_name}' does not exist."
    end

    def profile_image
      "https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png"
    end

    def profile_banner
      "http://publishersconvention.com/wp-content/uploads/2014/12/colorful-triangles-background-800x300.jpg"
    end

    def tweets
      [TwitterWrapper::NullTweet.new(@screen_name)]
    end

    def screen_name
      "The user '#{@screen_name}' does not exist."
    end

    def tweets_count
      0
    end

    def followers_count
      0
    end

    def favourites_count
      0
    end
  end
end
