class ItemsController < ApplicationController
  def index
  end

  private

  def items_params
    params.require(:items).permit(:image, :product_name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :days_until_delivery_id, :price).merge(user_id: current_user.id)
  end
end
