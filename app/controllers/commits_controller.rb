class CommitsController < ApplicationController
  def index
    @user_events = UserActivity.events(current_user.username, current_user.oauth_token)
  end
end
