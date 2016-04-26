module TwitterWrapper
  class User
    extend Forwardable
    include Virtus.model

    attribute :tweets, Array[TwitterWrapper::Tweet]
    attribute :user, Twitter::User

    def_delegator :user, :screen_name
    def_delegator :user, :followers_count
    def_delegator :user, :favourites_count
    def_delegator :user, :tweets_count
    def_delegator :user, :profile_image_url
    def_delegator :user, :profile_banner_url

    def description
      handle_none @user.description do
        @user.description
      end
    end

    def profile_image
      profile_image_url.to_s.sub("_normal", "")
    end

    def profile_banner
      profile_banner_url ? original_banner : default_banner
    end

    private

    def original_banner
      profile_banner_url.to_s.sub("_normal", "")
    end

    def default_banner
      "http://publishersconvention.com/wp-content/uploads/2014/12/colorful-triangles-background-800x300.jpg"
    end

    private

    def handle_none(value)
      if value.present?
        yield
      else
        'Description not availale'
      end
    end
  end
end
