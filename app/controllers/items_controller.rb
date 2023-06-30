class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @current_user = current_user
    render 'show'
  end
  
  def edit
    if current_user == @item.user && !@item.order.present?
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  def destroy
    if user_signed_in? && @item.user_id == current_user.id
      @item.order.destroy if @item.order.present?
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :handing_time_id).merge(user_id: current_user.id)
  end
end
