class PagesController < ApplicationController
  before_action :authenticate_user!, except: [ :home ]

  def home
  end

  def profile
    @user = current_user
  end

  def available_books
    @books = Book.all
  end

  def request_book
  end
end
