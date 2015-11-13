class CardsController < ApplicationController
  before_filter :authenticate_user
  
  def new
    @list = List.find(params[:list_id])
    @card = Card.new
    @labels = @current_user.labels
  end

  def edit
    @list = List.find(params[:list_id])
    @card = Card.find(params[:id])
    @labels = @current_user.labels
  end

  def create
    @list = List.find(params[:list_id])
    @card = @list.cards.new(card_params)
  
    if @card.save
      redirect_to board_path
    else 
      render 'new'
    end
  end

  def update
    @list = List.find(params[:list_id])
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to board_path
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to board_path
  end

  def add_label
    @labels = @current_user.labels
    @list = List.find(params[:list_id])
    @card = Card.find(params[:id])
  end

  def label_save
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to board_path
    else
      render 'edit'
    end
  end

  private
    def card_params
      params.require(:card).permit(:title, :position, {:label_ids => []})
    end
end
