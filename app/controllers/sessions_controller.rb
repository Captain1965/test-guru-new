# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Hello, #{current_user.first_name}" if current_user
  end
end
