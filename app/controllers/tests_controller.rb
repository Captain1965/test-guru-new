class TestsController < ApplicationController
  before_action :test_find, only: %i[new index]

  def index
    render inline: '<%= @tests%>'

    #render json: { test: Test.all}
  end

  def edit
  end

  private

  def test_find
    @tests = Test.all
  end
end
