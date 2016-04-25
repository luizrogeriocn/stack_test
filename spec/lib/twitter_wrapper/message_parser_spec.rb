require 'rails_helper'
require 'twitter_wrapper/message_parser'

RSpec.describe TwitterWrapper::MessageParser do
  describe '#parse' do
    let(:message_parser) { TwitterWrapper::MessageParser.new(message) }

    context 'message with a link' do
      let(:message) { "great site: https://www.google.com" }
      subject(:parsed_message) { message_parser.parse }

      it { is_expected.to eq("great site: <a href='https://www.google.com' target='_blank'>https://www.google.com</a>") }
    end

    context 'message with a mention' do
      let(:message) { "great user: @stackcommerce" }
      subject(:parsed_message) { message_parser.parse }

      it { is_expected.to eq("great user: <a href='/stackcommerce'>@stackcommerce</a>") }
    end

    context 'message with a link and a mention' do
      let(:message) { "great: @stackcommerce https://www.google.com" }
      subject(:parsed_message) { message_parser.parse }

      it { is_expected.to eq("great: <a href='/stackcommerce'>@stackcommerce</a> <a href='https://www.google.com' target='_blank'>https://www.google.com</a>") }
    end

    context 'message with no links and no mentions' do
      let(:message) { "stackcommerce and google are awesome" }
      subject(:parsed_message) { message_parser.parse }

      it { is_expected.to eq(message) }
    end

    context 'message with multiple mentions' do
      let(:message) { "@stackcommerce @akitaonrails" }
      subject(:parsed_message) { message_parser.parse }

      it { is_expected.to eq("<a href='/stackcommerce'>@stackcommerce</a> <a href='/akitaonrails'>@akitaonrails</a>") }
    end

    context 'message with multiple links' do
      let(:message) { "https://www.stackcommerce.com https://www.codeminer42.com" }
      subject(:parsed_message) { message_parser.parse }

      it { is_expected.to eq("<a href='https://www.stackcommerce.com' target='_blank'>https://www.stackcommerce.com</a> <a href='https://www.codeminer42.com' target='_blank'>https://www.codeminer42.com</a>") }
    end
  end
end
