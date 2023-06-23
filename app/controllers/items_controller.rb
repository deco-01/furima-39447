class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
    @items = [] if @items.nil?
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

  def show
    @item = Item.find(params[:id])
    @current_user = current_user
  end

  def destroy
  end

  def edit
    @item = Item.find(params[:id])

    if user_signed_in?
      if @item.user_id != current_user.id
        redirect_to root_path
      else
        render :edit
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      flash.now[:alert]
      render :edit
    end
  end

  def back_to_show
    @item = Item.find(params { :id })
    redirect_to @item
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :price, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :handing_time_id).merge(user_id: current_user.id)
  end
end
