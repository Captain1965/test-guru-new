# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    tests_find
  end

  def start
    test_find
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def tests_find
    @tests = Test.all
  end

  def test_find
    @test = Test.find(params[:id])
  end

  def user_find
    @user = User.first
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
