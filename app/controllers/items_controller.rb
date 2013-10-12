class ItemsController < ApplicationController
  def index
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(params[:item])
    @item.save!

    redirect_to :root
  end
  
  def show
    @item = Item.find(params[:id])
  end 
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to :root
  end  

end
