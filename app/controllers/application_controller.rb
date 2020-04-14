class ApplicationController < ActionController::Base
  before_action :current_candidate
  before_action :authorized

  private 
  def current_candidate
    @current_candidate = Candidate.find_by(id: session[:candidate_id])
  end

  def authorized
    if @current_candidate
      # fixme
    else
      flash[:errors] = ["Must be logged in."]
      redirect_to login_path
    end
  end
end
