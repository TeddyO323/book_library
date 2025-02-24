require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: "test@example.com", password: "password123")
    @book = Book.create!(title: "Test Book", author: "Jane Doe")
    @borrowing = Borrowing.create!(user: @user, book: @book, due_date: 2.weeks.from_now)
  end


  test "should get index" do
    get borrowings_url
    assert_response :success
  end

  test "should get new" do
    get new_borrowing_url
    assert_response :success
  end
  test "should create borrowing" do
    borrowing = Borrowing.new(user: users(:one), book: books(:one), due_date: Date.today + 14.days)
    assert borrowing.valid?
  end

  test "should show borrowing" do
    get borrowing_url(@borrowing)
    assert_response :success
  end

  test "should get edit" do
    get edit_borrowing_url(@borrowing)
    assert_response :success
  end

  test "should update borrowing" do
    patch borrowing_url(@borrowing), params: { borrowing: {} }
    assert_redirected_to borrowing_url(@borrowing)
  end

  test "should destroy borrowing" do
    assert_difference("Borrowing.count", -1) do
      delete borrowing_url(@borrowing)
    end

    assert_redirected_to borrowings_url
  end
end
