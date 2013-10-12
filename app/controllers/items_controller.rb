class ItemsController < ApplicationController
  
  def index
    @categories = Category.all
    if params[:tag]
      @items = Item.category_search(params[:tag])
    else  
      @items = Item.search(params[:search])
    end
  end
  
  def categories
    @categories = Category.search(params[:tag])
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
