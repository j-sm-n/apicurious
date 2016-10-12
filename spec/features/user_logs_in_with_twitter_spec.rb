require 'rails_helper'

describe "The signin process", :type => :feature do
  it "logs in user with github" do
    VCR.use_cassette("signin") do
      stub_omniauth
      visit root_path

      expect(page.status_code).to eq(200)

      click_link "Sign in with Github"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("j-sm-n")
      expect(page).to have_link("Logout")
    end
  end
end
