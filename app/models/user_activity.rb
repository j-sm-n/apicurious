class UserActivity
  attr_reader :repos,
              :commits

  def initialize(events)
    @repos   = parse_repos(events)
    @commits = parse_commits(events)
  end

  def self.events(username, token)
    raw_events = GithubService.user_events(username, token)
    UserActivity.new(raw_events)
  end

  def parse_repos(events)
    push_events = parse_commit_events(events)
    push_events.map { |event| event[:repo] }
  end

  def parse_commits(events)
    push_events = parse_commit_events(events)
    push_events.map { |event| event[:payload][:commits] }.flatten
  end

  def parse_commit_events(events)
    events.map { |event| event if event[:type] == "PushEvent" }.compact
  end
end
