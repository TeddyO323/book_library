require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  test "should not save borrowing without user and book" do
    borrowing = Borrowing.new
    assert_not borrowing.save, "Saved the borrowing without a user or book"
  end

  test "should create borrowing with name" do
    borrowing = Borrowing.new(user: users(:one), book: books(:one), name: "John Doe")
    assert borrowing.save
  end
  

  test "should set due date to 2 weeks from today" do
    user = User.create!(email: "user@example.com", password: "password")
    book = Book.create!(title: "Sample Book", author: "Author", isbn: "123456")

    borrowing = Borrowing.create!(user: user, book: book)

    assert_equal Date.today + 14.days, borrowing.due_date, "Due date is not set correctly"
  end
end
