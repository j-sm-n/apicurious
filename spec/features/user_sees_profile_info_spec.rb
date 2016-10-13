require 'rails_helper'

describe "After user logs in", :type => :feature do
  it "shows user their profile info" do
    VCR.use_cassette("sign_in_and_see_profile") do
      stub_omniauth
      visit root_path
      click_link "Sign in with Github"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("j-sm-n")
      expect(page).to have_content("Followers: 5")
      expect(page).to have_content("Following: 13")
      expect(page).to have_content("Bio: student at @turingschool")
    end
  end

  it "shows user their recent commits" do
    VCR.use_cassette("sign_in_and_see_recent_commits") do
      stub_omniauth
      visit root_path
      click_link "Sign in with Github"

      expect(page).to have_link("View Recent Commits")
    end
  end
end
