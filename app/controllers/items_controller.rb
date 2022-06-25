class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    redirect_to root_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :days_until_delivery_id, :price).merge(user_id: current_user.id)
  end
end
