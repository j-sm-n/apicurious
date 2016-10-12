class UsersController < ApplicationController
  def show
    @github_user = GithubUser.find(current_user.oauth_token)
  end
end
