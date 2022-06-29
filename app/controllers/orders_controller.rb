class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:postcode, :prefecture, :city, :street, :address_other, :phone_num).merge(user_id: current_user.id, item_id: @item.id)
  end

end
