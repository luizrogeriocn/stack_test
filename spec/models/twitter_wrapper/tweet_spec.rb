require 'rails_helper'

RSpec.describe TwitterWrapper::Tweet do
  let(:api) { TwitterWrapper::Api.new(TwitterWrapper::Client.build) }
  let(:user_timeline) { VCR.use_cassette("luizrogeriocn_timeline") { api.user_timeline("luizrogeriocn") } }
  let(:tweet) { TwitterWrapper::Tweet.new(user_timeline.first) }

  describe '#created_at' do
    subject(:created_at) { tweet.created_at }

    it { is_expected.to be_a(Time) }
  end

  describe '#text' do
    #refactor Tweet to have the parser injected, so it can be mocked.
  end
end
