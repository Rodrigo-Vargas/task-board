class ListsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    #@categories = Category.all
  end

  def new
    @list = List.new
  end

 def edit
    @list = List.find(params[:id])
  end

  def create
    @list = @current_user.lists.new(list_params)

    if @list.save
      redirect_to board_path
    else
      render 'new'
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to board_path
    else 
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])

    @list.cards.each do |card|
      card.destroy
    end

    @list.destroy

    redirect_to board_path
  end

  private
    def list_params
      params.require(:list).permit(:title, :position)
    end
end
