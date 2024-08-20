class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]
  def new
    @book = Book.new
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user = current_user # 投稿したユーザーを設定

    if @book.save
      flash[:notice] = "Book was successfully created."
       redirect_to @book, notice: 'Book was successfully created.'
    else
      @books=Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    
  end

  def show
    @book = Book.find(params[:id])
    @book_new=Book.new
    @user = current_user
    @user2=@book.user
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to @book
    else
      render :edit
    end
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def get_image
    image.attached? ? image : 'default_image.png'  # Active Storageの場合
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
    def is_matching_login_user
      @book = Book.find(params[:id])
      unless @book.user.id == current_user.id
      redirect_to books_path 
      end
    end
end