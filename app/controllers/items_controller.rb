class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(params[:item])
    
    if @item.save
      redirect_to :root
    else
      render 'new'
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end 
  
  def dashboard
    @items = Item.where(user_id: current_user.id)   
  end  

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to :root
  end  

end
