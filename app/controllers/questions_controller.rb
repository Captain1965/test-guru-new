class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]

  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: 'Questions for the test N <%= params[:test_id] %>
                                             <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Question : <%= Question.find_by(id: params[:id].to_i) %>'
  end

  def new
  end

  def create
    @question = @test.questions.create!(question_create_params)
  end

  def destroy
    @question.destroy
  end


  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_create_params
    params.require(:question).permit(:body)
  end

  def rescue_question_with_not_found
    render plain: 'Question not found'
  end
end
