class ApplicationsController < ApplicationController
  before_action :candidate_match, only: [:show, :edit, :destroy, :update]

  def index
    @applications = Application.where(candidate_id: current_candidate.id)
  end

  def show
    @application = Application.find(params[:id])
  end
  def new
    @application = Application.new 
    @candidates = Candidate.all 
    @positions = Position.all
  end
  def create
    application = Application.new(position_id: params[:application][:position_id], candidate_id: current_candidate.id) 
    if application.save
      redirect_to application_path(application)
    else
      flash[:errors] = application.errors.full_messages
      redirect_to new_application_path
    end
  end
  def update
    application = Application.find(params[:id])
    application.submitted = true
    application.save
    redirect_to application_path(application)
  end

  private
  def application_params
    params.require(:application).permit(:position_id)
  end

  def candidate_match
    @application = Application.find(params[:id])
    if current_candidate != @application.candidate
      flash[:errors] = ["You can only view your applications"]
      redirect_to candidate_path(current_candidate)
    end
  end

end
