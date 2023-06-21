class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @item = Item.all
    # @items = [] if @items.nil?
  end

  def some_action
    @items = Item.where(some_condition: true)
    render :index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash.now[:alert] = @item.errors.full_messages
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :handing_time_id).merge(user_id: current_user.id)
  end
end
