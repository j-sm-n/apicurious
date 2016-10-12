describe "GithubService" do
  xit "returns Github user info" do
    VCR.use_cassette("github_service.find_by_uid") do

      user = GithubService.find_by_token(ENV['MY_TOKEN'])

      expect(user[:avatar_url]).to eq("https://avatars.githubusercontent.com/u/22796821?v=3")
      expect(user[:followers]).to eq("0")
      expect(user[:following]).to eq("1")
    end
  end
end
