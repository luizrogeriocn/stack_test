module TwitterWrapper
  class MessageParser
    def self.parse(message)
      new(message.dup).parse
    end

    def initialize(message)
      @message = message
    end

    def parse
      parse_mentions
      parse_links
    end

    private

    def parse_mentions
      @message.gsub!(/@([\w]+)/i) do |match|
        "<a href='/#{match.sub(/^@/, '')}'>#{match}</a>"
      end
    end

    def parse_links
      @message.gsub(/(https?:\/\/)[^\s\(\[\{\)\]\}\,\!]+/) do |match|
        "<a href='#{match}' target='_blank'>#{match}</a>"
      end
    end
  end
end
