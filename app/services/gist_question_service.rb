# frozen_string_literal: true

class GistQuestionService

  Gist_struct = Struct.new(:gist_record, :html_url, :success?)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
    @client_html = nil
  end

  def call
    client = @client.create_gist(gist_params)
    @client_html = client.html_url
    gist_new = Gist_struct.new(client, @client_html, success?)
  end

  private

  def success?
    @client_html != nil ? true : false
  end

  def gist_params
    { files: { "A question about #{@test.title} from TestGuru":
    { content: gist_content } }, public: true }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end
end
