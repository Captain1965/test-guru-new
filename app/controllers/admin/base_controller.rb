# frozen_string_literal: true

class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Only admin' unless current_user.type == 'Admin'
  end
end
