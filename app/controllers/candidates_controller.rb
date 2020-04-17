class CandidatesController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :candidate_match, only: [:show, :edit, :destroy, :update]

  def index
    flash[:errors] = ["You cannot view all candidates"]
    redirect_to candidate_path(current_candidate)
  end

  def new
    @candidate = Candidate.new 
  end
  def create
    candidate = Candidate.create(candidate_params)
    # byebug
    if candidate.valid? 
      redirect_to login_path
    else
      flash[:errors] = candidate.errors.full_messages
      redirect_to new_candidate_path
    end
  end

  def update
    candidate = Candidate.find(params[:id])
    candidate.update(candidate_params)
    if candidate.valid?
      redirect_to candidate_path(candidate)
    else
      flash[:errors] = candidate.errors.full_messages
      redirect_to edit_candidate_path(candidate)
    end
  end
  def destroy
    candidate = Candidate.find(params[:id])
    candidate.destroy
  end

  private
  def candidate_params
  params.require(:candidate).permit(Candidate.column_names, :password)
  end

  def candidate_match
    @candidate = Candidate.find(params[:id])
    if current_candidate != @candidate
      flash[:errors] = ["You can only view yourself"]
      redirect_to candidate_path(current_candidate)
    end
  end
end
