class GithubService
  def self.find_by_token(token)
    response = connection(token).get("/user")
    JSON.parse(response.body, symbolize_names: :true)
  end

  def self.connection(token)
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end
end
