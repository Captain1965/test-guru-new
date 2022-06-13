class Admin::TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :test_find, only: %i[show edit destroy update start]

  def index
    tests_find
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    byebug
    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
   end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def start
    user_find
    current_user.tests.push(@test)
    redirect_to @user.test_passage(@test)
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

  def user_find
    @user = User.first
  end
end
