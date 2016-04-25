module TwitterWrapper
  class User
    extend Forwardable
    include Virtus.model

    attribute :tweets, Array[TwitterWrapper::Tweet]
    attribute :user, Twitter::User

    def_delegators :user, :screen_name
    def_delegators :user, :followers_count
    def_delegators :user, :favourites_count
    def_delegators :user, :tweets_count
    def_delegators :user, :profile_image_url
    def_delegators :user, :profile_banner_url

    def description
      handle_none @user.description do
        @user.description
      end
    end

    def original_profile_image
      profile_image_url.to_s.sub("_normal", "")
    end

    def original_profile_banner
      profile_banner_url.to_s.sub("_normal", "")
    end

    private

    def handle_none(value)
    if value.present?
      yield
    else
      'Description not available.'
    end
  end
  end
end
