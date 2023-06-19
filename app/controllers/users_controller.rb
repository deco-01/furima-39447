class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 保存成功時の処理
    else
      render 'new'
    end

    def new
      @user = User.new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana,
                                 :first_name_kana, :birth_day, :nickname)
  end
end
