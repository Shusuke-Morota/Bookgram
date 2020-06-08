class UsersController < ApplicationController
  def index #ユーザーの一覧画面を作る
  	@users = User.all #.allとすることでUserモデルからユーザーの情報を全て持ってくる。
  end

  def show
  	@user = User.find(params[:id]) #一人のユーザーの情報を持ってきて、それを@userという変数に入れる。params[:id]で誰のユーザーidを取ってくるのかを指令している。
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params) 
  	redirect_to user_path(@user) #ユーザーの詳細画面に戻る
  end

  private #構文 params.require(モデル名).permit(カラム名1,2,3...)
  def user_params
  	params.require(:user).permit(:username, :email, :profile, :profile_image) #更新するのはusername, :email, :profile, :profile_image
  end
end
