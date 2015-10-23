class ListsController < ApplicationController
  before_filter :authenticate_user
  
  def index
    #@categories = Category.all
  end

  def new
    @list = List.new
  end

 def edit
    #@category = Category.find(params[:id])
  end

  def create
    @list = @current_user.lists.new(list_params)

    if @list.save
      redirect_to board_path
    else
      render 'new'
    end
  end

  #def update
  #  @category = Category.find(params[:id])

#    if @category.update(list_params)
#      redirect_to category_settings_path
#    else 
#      render 'edit'
#    end
#  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy

    redirect_to board_path
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end
end
