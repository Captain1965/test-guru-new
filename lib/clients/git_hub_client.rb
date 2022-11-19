class GitHubClient

  def create_gists(params)
    if ENV.fetch('GITHUB_GIST_TOKEN')
      @http_client = setup_http_client.create_gist(params)
    else
      redirect_to @test_passage, notice: 'incorrect token Gist'
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end
end
