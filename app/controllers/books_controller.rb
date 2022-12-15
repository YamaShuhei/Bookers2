class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      successfully_message
      redirect_to books_path
    else
      error_message
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    successfully_message
    redirect_to book_path
    else
    error_message
    render :edit
    end
  end


    private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @user = Book.find(params[:id])
    user_id = @user.user_id
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end

end
