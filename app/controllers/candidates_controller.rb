class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all 
  end
  def show
    @candidate = Candidate.find(params[:id])
  end
  def new
    @candidate = Candidate.new 
  end
  def create
    candidate = Candidate.create(candidate_params)
    if candidate.valid? 
      redirect_to candidate_path(candidate)
    else
      flash[:errors] = candidate.errors.full_messages
      redirect_to new_candidate_path
    end
  end
  def edit
    @candidate = Candidate.find(params[:id])
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
  params.require(:candidate).permit(Candidate.column_names)
  end
end
