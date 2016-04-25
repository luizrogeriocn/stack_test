module TwitterWrapper
  class NullTweet
    def initialize(author_name)
      @author_name = author_name
    end

    def text
      "'#{@author_name}' doesn't exist.. Yet! Create it and bring it to life at <a href='https://twitter.com/signup?lang=en'>twitter.com</a>"
    end

    def created_at
      DateTime.current
    end

    def id
      0
    end
  end
end
