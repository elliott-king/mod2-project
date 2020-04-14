class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end
  def create
    candidate = Candidate.find_by(name: params[:session][:name])
    # byebug
    if candidate && candidate.authenticate(params[:session][:password])
      session[:candidate_id] = candidate.id 
      redirect_to candidate_path(candidate)
    else
      flash[:errors] = ["User does not exist."]
      redirect_to new_candidate_path
    end
  end
  def destroy
    session.delete(:candidate_id)
    redirect_to login_path
  end
end