require 'rails_helper'

RSpec.describe TwitterWrapper::NullUser do
  let(:screen_name) { 'im_not_on_twitter' }
  let(:null_user) { TwitterWrapper::NullUser.new(screen_name) }

  describe '#default_text' do
    subject(:default_text) { null_user.default_text }

    it { is_expected.to match(screen_name) }
  end

  describe '#any_count' do
    subject(:any_count) { null_user.any_count }

    it { is_expected.to eq(0) }
  end

  describe '#profile_banner' do
    subject(:banner_url) { null_user.profile_banner }

    it { is_expected.to eq("http://publishersconvention.com/wp-content/uploads/2014/12/colorful-triangles-background-800x300.jpg") }
  end

  describe '#profile_image' do
    subject(:image_url) { null_user.profile_image }

    it { is_expected.to eq("https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png") }
  end

  describe '#tweets' do
    subject(:tweets) { null_user.tweets }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include(a_kind_of(TwitterWrapper::NullTweet)) }
    it { is_expected.to satisfy { |tweets| tweets.length == 1 } }
  end

end
