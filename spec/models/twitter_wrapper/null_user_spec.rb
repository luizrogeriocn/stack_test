require 'rails_helper'

RSpec.describe TwitterWrapper::NullUser do
  let(:screen_name) { 'im_not_on_twitter' }
  let(:null_user) { TwitterWrapper::NullUser.new(screen_name) }

  describe '#description' do
    subject(:ddescription) { null_user.description }

    it { is_expected.to match(screen_name) }
  end

  describe '#profile_image' do
    subject(:image_url) { null_user.profile_image }

    it { is_expected.to match(/abs.twimg.com/) }
  end

  describe '#profile_banner' do
    subject(:banner_url) { null_user.profile_banner }

    it { is_expected.to match(/publishersconvention.com/) }
  end

  describe '#screen_name' do
    subject(:user_name) { null_user.screen_name }

    it { is_expected.to match(screen_name) }
  end

  describe '#tweets_count' do
    subject(:tweets_count) { null_user.tweets_count }

    it { is_expected.to eq(0) }
  end

  describe '#followers_count' do
    subject(:followers_count) { null_user.followers_count }

    it { is_expected.to eq(0) }
  end

  describe '#favourites_count' do
    subject(:favourites_count) { null_user.favourites_count }

    it { is_expected.to eq(0) }
  end

  describe '#tweets' do
    subject(:tweets) { null_user.tweets }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include(a_kind_of(TwitterWrapper::NullTweet)) }
    it { is_expected.to satisfy { |tweets| tweets.length == 1 } }
  end

end
