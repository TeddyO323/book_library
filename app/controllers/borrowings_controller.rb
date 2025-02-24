class BorrowingsController < ApplicationController
  def index
    @borrowings = Borrowing.includes(:book, :user).all
  end

  def create
    @borrowing = Borrowing.new(borrowing_params)
    if @borrowing.save
      redirect_to books_path, notice: "Book borrowed successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def borrowing_params
    params.require(:borrowing).permit(:user_id, :book_id, :due_date)
  end
end
