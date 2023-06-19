class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      # ログイン成功の処理（例: ダッシュボードページにリダイレクト）
    else
      flash.now[:error] = 'メールアドレスまたはパスワードが正しくありません。'
      render :new
    end
  end
end