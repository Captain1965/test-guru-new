class TestsController < ApplicationController
  before_action :test_find, only: %i[index show]

  def index
    render inline: '<%= @tests%>'
  end

  def show
    render inline: '<%= @tests.find(params[:id])%>'
  end

  private

  def test_find
    @tests = Test.all
  end
end
