require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # Move inside the class

  setup do
    @user = users(:user_one)  # Ensure user fixture exists
    sign_in @user  # Simulate a logged-in user

    @book = books(:one)  # Ensure book fixture exists
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count', 1) do
      post books_path, params: { book: { title: "Test Book", author: "John Doe", isbn: "1234567890" } }
    end
    assert_redirected_to book_path(Book.last)  # Ensure it redirects after creation
  end
  
  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { title: "Updated Title", author: "Updated Author" } }
    assert_redirected_to book_url(@book)
  end
  test "should destroy book" do
    @book.borrowings.destroy_all  # Ensure dependent borrowings are deleted
  
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end
  
    assert_redirected_to books_url
  end
  
end
