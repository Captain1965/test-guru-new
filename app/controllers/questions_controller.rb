class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create ]
  before_action :find_question, only: %i[destroy]

  def index
    render inline: 'Questions for the test N <%= params[:test_id] %>
                                             <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Question : <%= Question.find(params[:id])%> id : <%= params[:id]%>'
  end

  def new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    test = @question.test
    @question.destroy
    redirect_to test_questions_path(test)
  end

  def edit
    find_question
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])

  end

  def rescue_question_with_not_found
    render plain: 'Question not found'
  end
end
