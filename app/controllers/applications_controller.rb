class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end
  def new
    @application = Application.new 
    @candidates = Candidate.all 
    @positions = Position.all
  end
  def create
    application = Application.create(application_params)
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
  params.require(:application).permit(:candidate_id, :position_id)
  end
end
