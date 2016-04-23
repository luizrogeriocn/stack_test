require 'rails_helper'
require 'twitter_wrapper/client'
require 'twitter_wrapper/api'
require 'twitter'

RSpec.describe TwitterWrapper::Api do
  describe '#user_timeline' do
    let(:api) { TwitterWrapper::Api.new(TwitterWrapper::Client.build) }
    subject(:user_timeline) { VCR.use_cassette(cassete) { api.user_timeline(screen_name) } }

    context 'with a valid screen_name' do
      let(:cassete) { "twitter_ok" }
      let(:screen_name) { 'luizrogeriocn' }

      it 'returns an array' do
        expect(user_timeline.class).to eq(Array)
      end

      it 'returns Tweets inside the array' do
        expect(user_timeline.first.class).to eq(Twitter::Tweet)
      end

      it 'returns 25 tweets' do
        expect(user_timeline.length).to eq(25)
      end
    end

    context 'with an invalid screen_name' do
      let(:cassete) { "twitter_invalid" }
      let(:screen_name) { 'invalid_name_no_one_ever_had_on_twitter' }

      it 'raises NotFound error' do
        expect { user_timeline }.to raise_error(Twitter::Error::NotFound, "Sorry, that page does not exist.")
      end
    end
  end
end
