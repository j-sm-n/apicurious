class GithubUser
  attr_reader :followers,
              :following,
              :avatar,
              :bio

  def initialize(raw_user)
    @followers = raw_user[:followers]
    @following = raw_user[:following]
    @avatar = raw_user[:avatar_url]
    @bio = raw_user[:bio]
  end

  def self.find(token)
    raw_user = GithubService.find_by_token(token)
    GithubUser.new(raw_user)
  end
end
