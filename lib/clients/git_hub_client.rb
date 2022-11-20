# frozen_string_literal: true
class GitHubClient

  def create_gists(params)
      ENV.fetch('GITHUB_GIST_TOKEN')
    @http_client = setup_http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end
end
