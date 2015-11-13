class PagesController < ApplicationController
  before_filter :authenticate_user
  layout "site", :only => :index
  
  def index
    if (@current_user)
      redirect_to board_path
    end
  end

  def board
    @lists = @current_user.lists
    @labels = @current_user.labels
  end
end
