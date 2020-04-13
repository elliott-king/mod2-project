class PositionsController < ApplicationController
  def index
    @positions = Position.all 
  end
  def show
    @position = Position.find(params[:id])
  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
end
