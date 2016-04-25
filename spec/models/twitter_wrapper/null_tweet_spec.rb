require 'rails_helper'

RSpec.describe TwitterWrapper::NullTweet do
  let(:screen_name) { 'im_not_on_twitter' }
  let(:null_tweet) { TwitterWrapper::NullTweet.new(screen_name) }

  describe '#created_at' do
    subject(:created_at) { null_tweet.created_at }

    it { is_expected.to be_a(DateTime) }
  end

  describe '#text' do
    subject(:text) { null_tweet.text }

    it { is_expected.to match(screen_name) }
  end

  describe '#id' do
    subject(:id) { null_tweet.id }

    it { is_expected.to eq(0) }
  end
end
