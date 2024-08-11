class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
def index
  @users = User.all         # 全てのユーザー
  @book = Book.new          # 新しい本（フォーム用）
  @books = Book.all         # 全ての本
  @user = current_user      # ログインしているユーザー（基本自分）
end
  end
    
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end