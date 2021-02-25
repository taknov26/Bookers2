class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.page(params[:page]).reverse_order
      render "index"
    end
  end

  def show
    @book = Book.new
    @book_find = Book.find(params[:id])
    @user = @book_find.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
      flash[:notice] = "You have updated book successfully."
    else
      render "edit"
    end
  end

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
