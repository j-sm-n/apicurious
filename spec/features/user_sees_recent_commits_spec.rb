require 'rails_helper'

describe "After user logs in", :type => :feature do
  it "allows user to view all of their recent commits" do
    VCR.use_cassette("user_views_commits") do
      stub_omniauth
      visit root_path
      click_link "Sign in with Github"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_link("View Recent Commits")

      click_link "View Recent Commits"

      expect(current_path).to eq(commits_path)
      expect(page).to have_content("Recent Commit Activity")
    end
  end
end
