class ItemsController < ApplicationController
  def index
  end

  def new
    @item = current_user.item.build
  end

  def create
  end
end
