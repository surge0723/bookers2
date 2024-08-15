class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    # @books=Book.page(params[:page])
    
  end

  def show
    @book = Book.find(params[:id])
    @book_new=Book.new
    @user = current_user
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
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
end
