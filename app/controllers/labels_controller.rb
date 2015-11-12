class LabelsController < ApplicationController
  before_filter :authenticate_user
  
  def new
    @label = Label.new
  end

  def edit
    @label = Label.find(params[:id])
  end

  def create
    @label = @current_user.labels.new(label_params)
  
    if @label.save
      redirect_to board_path
    else
      render 'new'
    end
  end

  def update
    @label = Label.find(params[:id])

    if @label.update(label_params)
      redirect_to board_path
    else
      render 'edit'
    end
  end

  private
    def label_params
      params.require(:label).permit(:name, :color)
    end
end
