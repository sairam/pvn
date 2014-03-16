class ApplicationController < ActionController::Base

  before_filter :get_current_user # to be removed once devise is setup
  protect_from_forgery

private
  def get_current_user
    sign_in(User.first)
  end

end
