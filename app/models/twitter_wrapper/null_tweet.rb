module TwitterWrapper
  class NullTweet
    def initialize(author_name)
      @author_name = author_name
    end

    def big_profile_image
      "https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png"
    end

    def author
      @author_name
    end

    def message
      "Seems like we cant get #{@author_name}'s tweets."
    end

    def created_at
      DateTime.current
    end

    def id
      0
    end

    def retweet?
      false
    end
  end
end
