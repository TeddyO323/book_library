class BooksController < ApplicationController
  before_action :authenticate_user! # Ensure a user is logged in

  def index
    @available_books = Book.where.not(id: Borrowing.where(returned: false).select(:book_id))
  end

  def show
    @book = Book.find_by!(id: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to books_path, alert: "Book not found."
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_books
    @borrowed_books = current_user.borrowings.includes(:book).where(returned: false).map(&:book)
  end

  def borrow
    book = Book.find_by(id: params[:id])
    return redirect_to books_path, alert: "Book not found." unless book

    if Borrowing.exists?(book: book, returned: false)
      redirect_to books_path, alert: "This book is already borrowed."
      return
    end

    borrowing = current_user.borrowings.find_or_initialize_by(book: book)
    borrowing.update!(due_date: Date.today + 7.days, returned: false)
    book.update!(borrowed: true)

    redirect_to my_books_path, notice: "You have borrowed '#{book.title}'"
  end

  def return_book
    borrowing = current_user.borrowings.find_by(book_id: params[:id], returned: false)

    if borrowing
      borrowing.update!(returned: true)
      borrowing.book.update!(borrowed: false)
      redirect_to my_books_path, notice: "You have returned '#{borrowing.book.title}'"
    else
      redirect_to my_books_path, alert: "You haven't borrowed this book or it's already returned."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description, :image)
  end
end


