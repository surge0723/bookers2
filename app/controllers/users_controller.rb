class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    @book = Book.new
    @books = current_user.books
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

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end