class RegistrationsController < ApplicationController

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザーの登録が成功した場合の処理
    else
      # ユーザーの登録が失敗した場合の処理
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # ユーザー情報の更新が成功した場合の処理
    else
      # ユーザー情報の更新が失敗した場合の処理
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day)
  end
end
