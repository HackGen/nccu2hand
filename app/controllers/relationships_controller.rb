class RelationshipsController < ApplicationController

  def create
    @item = Item.find(params[:relationship][:item_id])
    @item.follow_by!(current_user)
    respond_to do |format|
      format.html { redirect_to @item }
      format.js
    end
  end

  def destroy
    @item = Relationship.find(params[:id]).item
    @item.unfollow_by!(current_user)
    respond_to do |format|
      format.html { redirect_to @item }
      format.js
    end
  end
end