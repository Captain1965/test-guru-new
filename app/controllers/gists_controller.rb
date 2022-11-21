class GistsController < ApplicationController

  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success
      current_user.gists.create!(question: @test_passage.current_question,
                                 url: result.html_url)
      flash[:notice] = "#{t('.success')} #{view_context.link_to(t('.view'),
                                                                result.html_url,
                                                                target: "_blank")}"
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
   end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params['test_passage_id'])
  end
end
