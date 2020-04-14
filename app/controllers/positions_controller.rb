class PositionsController < ApplicationController
  def index
    @positions = Position.all 
  end

  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new 
  end

  def create
    position = Position.new(position_params)
    position.created_at = Time.now.to_datetime
    if position.save
      redirect_to position_path(position)
    else
      flash[:errors] = position.errors.full_messages
      redirect_to new_position_path
    end
  end
  
  def edit
    @position = Position.find(params[:id])
  end

  def update
    position = Position.find(params[:id])
    if position = Position.update(position_params)
      redirect_to position_path(position)
    else
      flash[:errors] = position.errors.full_messages
      redirect_to edit_position_path
    end    
  end

  private
  def position_params
    params.require(:position).permit!
  end

end
