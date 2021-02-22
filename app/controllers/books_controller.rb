class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
  end

  def update
  end

  def index
    @books = Book.all
  end

  def edit
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end


end
