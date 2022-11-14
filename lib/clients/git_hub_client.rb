class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'

  ACCESS_TOKEN = ENV['GITHUB_GIST_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
#byebug
    @http_client.access_token = ACCESS_TOKEN
    begin
      @http_client.create_gist(params)
    rescue
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(url: ROOT_ENDPOINT)
  end
end
