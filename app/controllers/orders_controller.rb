class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    else
      @order = Order.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      flash.now[:error] = @order.errors.full_messages
      render :index
    end
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
