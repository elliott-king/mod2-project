class ApplicationsController < ApplicationController

  before_action :candidate_match, only: [:show, :edit, :destroy, :update]

  def show
    @application = Application.find(params[:id])
  end
  def new
    @application = Application.new 
    @candidates = Candidate.all 
    @positions = Position.all
  end
  def create
    application = Application.create(position_id: params[:application][:position_id], candidate_id: current_candidate.id) 
    if application.valid? 
      redirect_to application_path(application)
    else
      flash[:errors] = application.errors.full_messages
      redirect_to new_application_path
    end
  end
  # todo: delete, maybe edit?

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
