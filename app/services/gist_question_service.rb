# frozen_string_literal: true

class GistQuestionService

  Gist_struct = Struct.new(:gist_record, :html_url, :success)

  def initialize(question, client = nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    client = @client.create_gists(gist_params)
    if client.html_url != nil
      gist_new = Gist_struct.new(client, client.html_url, true)
    else
      gist_new = Gist_struct.new(client,client.html_url, false)
    end
  end

  private

  def gist_params
    { files: { "A question about #{@test.title} from TestGuru":
    { content: gist_content } }, public: true }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
