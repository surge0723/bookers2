class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all         # 全てのユーザー
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
    
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  def get_image
    image.attached? ? image : 'default_image.png'  # Active Storageの場合
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end