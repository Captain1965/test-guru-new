# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gists(gist_params)
  end

  private

  def gist_params
    { files: { "A question about #{@test.title} from TestGuru" => { content: gist_content } }, public: true }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
