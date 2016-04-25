module TwitterWrapper
  class NullTweet
    def initialize(author_name)
      @author_name = author_name
    end

    def text
      "Seems like we cant get #{@author_name}'s tweets."
    end

    def created_at
      DateTime.current
    end

    def id
      0
    end
  end
end
