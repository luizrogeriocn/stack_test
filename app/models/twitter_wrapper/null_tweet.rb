module TwitterWrapper
  class NullTweet
    def initialize(author_name)
      @author_name = author_name
    end

    def text
      "Seems like we cant get #{@author_name}'s tweets."
    end

    def author
      @author_name
    end

    def created_at
      DateTime.current
    end


    def profile_image
      "https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png"
    end

    def retweeted?
      false
    end

    def id
      0
    end
  end
end
