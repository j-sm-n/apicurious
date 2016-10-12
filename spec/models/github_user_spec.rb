require 'rails_helper'

describe "Github User" do
  context ".find" do
    xit "returns the authenticated user's info" do
      VCR.use_cassette("github_user.find") do
        user = User.create(username: "turing-jaz",
                           uid: "22796821",
                           oauth_token: ENV['MY_TOKEN'])

        github_user = GithubUser.find(user[:uid])

        # expect(github_user).to eq("0")
        expect(github_user.followers).to eq("0")
        expect(github_user.following).to eq("1")
      end
    end
  end
end
