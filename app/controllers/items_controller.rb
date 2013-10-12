class ItemsController < ApplicationController
  
  def index
    @items = Item.search(params[:search])
  end
  
  def new
    @item = current_user.items.build
    @categories = Category.all
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
