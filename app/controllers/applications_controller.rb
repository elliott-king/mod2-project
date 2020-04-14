class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end
  def new
    @application = Application.new 
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
  def edit
    @application = Application.find(params[:id])
  end
  def update
    application = Application.find(params[:id])
    application.update(application_params)
    if application.valid?
      redirect_to application_path(application)
    else
      flash[:errors] = application.errors.full_messages
      redirect_to edit_application_path(application)
    end
  end
  # todo: delete

  private
  def application_params
  params.require(:application).permit(Application.column_names)
  end
end
