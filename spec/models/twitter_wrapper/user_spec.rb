require 'rails_helper'

RSpec.describe TwitterWrapper::User do
  let(:api) { TwitterWrapper::Api.new(TwitterWrapper::Client.build) }
  let(:user_timeline) { VCR.use_cassette(cassete_timeline) { api.user_timeline(screen_name) } }
  let(:user) { VCR.use_cassette(cassete_user) { api.user(screen_name) } }
  let(:twitter_user) { TwitterWrapper::User.new(user: user, tweets: user_timeline) }

  describe 'delegations' do
    let(:cassete_user) { "luizrogeriocn" }
    let(:cassete_timeline) { "luizrogeriocn_timeline" }
    let(:screen_name) { "luizrogeriocn" }
    subject(:delegations) { twitter_user }

    it { should delegate_method(:screen_name).to(:user) }
    it { should delegate_method(:followers_count).to(:user) }
    it { should delegate_method(:favourites_count).to(:user) }
    it { should delegate_method(:tweets_count).to(:user) }
    it { should delegate_method(:profile_image_url).to(:user) }
    it { should delegate_method(:profile_banner_url).to(:user) }
  end

  context 'for an user with no nil attributes' do
    let(:cassete_user) { "luizrogeriocn" }
    let(:cassete_timeline) { "luizrogeriocn_timeline" }
    let(:screen_name) { "luizrogeriocn" }

    describe '#description' do
      subject(:description) { twitter_user.description }

      it { is_expected.to be_present }
    end

    describe '#profile_image' do
      subject(:url) { twitter_user.profile_image }

      it { is_expected.not_to match(/normal/) }
    end

    describe '#profile_banner' do
      subject(:url) { twitter_user.profile_banner }

      it { is_expected.not_to match(/normal/) }
    end

    describe '#tweets' do
      subject(:tweets) { twitter_user.profile_banner }

      it { is_expected.not_to be_empty }
    end
  end
  # context 'with no profile picture' do
  #   let(:cassete_user) { "ana_azedo" }
  #   let(:cassete_timeline) { "ana_azedo_timeline" }
  #   let(:screen_name) { "ana_azedo" }

  #   subject(:url) { twitter_user.profile_image }

  #   it { is_expected.not_to match(/normal/) }
  # end
end
