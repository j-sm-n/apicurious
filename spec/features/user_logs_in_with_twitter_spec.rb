require 'rails_helper'

describe "The signin process", :type => :feature do
  it "logs in user with github" do
    stub_omniauth
    visit root_path

    expect(page.status_code).to eq(200)

    click_link "Sign in with Github"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("j-sm-n")
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "1234",
      credentials: {
        expires: false,
        token: "pizza"
      },
      info: {
        nickname: "j-sm-n"
      }
    })
  end
end
