class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]
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
    if @user.update(user_params)
      flash[:notice] = "Your profile was successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end
  
  def get_image
    image.attached? ? image : 'default_image.png'  # Active Storageの場合
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
      unless user.id == current_user.id
      redirect_to user_path(current_user)
      end
  end
  
end