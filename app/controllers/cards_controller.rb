class CardsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @card = Card.new
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

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to board_path
  end

  private
    def card_params
      params.require(:card).permit(:title)
    end
end
