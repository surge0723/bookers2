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
  end

  def show
        @book = Book.find(params[:id])
  end
  
    private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
