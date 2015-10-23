class PagesController < ApplicationController
  before_filter :authenticate_user, only: [:board]

  def index
  end

  def board
    @lists = @current_user.lists
  end
end
