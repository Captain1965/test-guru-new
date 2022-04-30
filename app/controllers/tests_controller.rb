class TestsController < ApplicationController
  before_action :tests_find, only: %i[index new show edit]
  before_action :test_find, only: %i[show edit destroy update]

  def index
  end

  def show
    @questions = test_find.questions
  end

  def edit
    #@test = test_find
  end

  def new

    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
   end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test = test_find
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def tests_find
    @tests = Test.all
  end

  def test_find
    @test = Test.find(params[:id])
  end
end
