# frozen_string_literal: true

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
    @http_client.access_token = ENV['GITHUB_GIST_TOKEN']
    begin
      @http_client.create_gist(params)
    rescue StandardError
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(url: ROOT_ENDPOINT)
  end
end
