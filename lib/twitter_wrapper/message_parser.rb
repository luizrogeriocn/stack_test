module TwitterWrapper
  class MessageParser
    def self.parse(message)
      new(message).parse
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
        "<a href='/?screen_name=#{match}'>#{match}</a>"
      end
      @message
    end

    def parse_links
      @message.gsub!(/https?:\/\/[\S]+/) do |match|
        "<a href='#{match}' target='_blank'>#{match}</a>"
      end
      @message
    end
  end
end
