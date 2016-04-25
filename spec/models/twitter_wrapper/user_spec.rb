require 'rails_helper'

RSpec.describe TwitterWrapper::User do
  let(:api) { TwitterWrapper::Api.new(TwitterWrapper::Client.build) }
  let(:user_timeline) { VCR.use_cassette(cassete_timeline) { api.user_timeline(screen_name) } }
  let(:user) { VCR.use_cassette(cassete_user) { api.user(screen_name) } }
  let(:twitter_user) { TwitterWrapper::User.new(user: user, tweets: user_timeline) }

  it { should delegate_method(:screen_name).to(:user) }
  it { should delegate_method(:followers_count).to(:user) }
  it { should delegate_method(:favourites_count).to(:user) }
  it { should delegate_method(:tweets_count).to(:user) }
  it { should delegate_method(:profile_image_url).to(:user) }
  it { should delegate_method(:profile_banner_url).to(:user) }

  describe '#profile_image_url' do
    context 'for an existing user'
      context 'with profile picture' do
        let(:cassete_user) { "luizrogeriocn" }
        let(:cassete_timeline) { "luizrogeriocn_timeline" }
        let(:screen_name) { "luizrogeriocn" }
        subject(:url) { twitter_user.profile_image_url }

        it { is_expected.to match(/normal/) }
      end

      context 'with no profile picture' do
        let(:cassete_user) { "ana_azedo" }
        let(:cassete_timeline) { "ana_azedo_timeline" }
        let(:screen_name) { "ana_azedo" }
        subject(:url) { twitter_user.profile_image_url }

        it { is_expected.to match(/\/default_profile_images\//) }
      end
  end

  describe '#original_profile_image' do
    context 'for an existing user'
      context 'with profile picutre' do
        let(:cassete_user) { "luizrogeriocn" }
        let(:cassete_timeline) { "luizrogeriocn_timeline" }
        let(:screen_name) { "luizrogeriocn" }
        subject(:url) { twitter_user.original_profile_image }

        it { is_expected.not_to match(/normal/) }
      end

      context 'with no profile picture' do
        let(:cassete_user) { "ana_azedo" }
        let(:cassete_timeline) { "ana_azedo_timeline" }
        let(:screen_name) { "ana_azedo" }

        subject(:url) { twitter_user.original_profile_image }

        it { is_expected.not_to match(/normal/) }
      end
  end

end
