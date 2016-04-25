class HomeController < ApplicationController
  respond_to :html, :json
  before_filter :user

  def index
    respond_with(@user)
  end

  private

  def user
    @user = Rails.cache.fetch("user_#{user_params}", expires_in: 5.minutes) do
      TwitterWrapper::UserFactory.build_user(user_params)
    end
  end

  def user_params
    (params[:screen_name] || "stackcommerce").sub(/^@/, '')
  end
end
