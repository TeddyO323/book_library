class Book < ApplicationRecord
  has_many :borrowings
  has_many :users, through: :borrowings  # A book can be borrowed by multiple users over time

  validates :image, presence: true, allow_blank: true  # Optional validation

  # Check if the book is overdue
  def overdue?
    borrowings.where(returned: false).any? { |b| b.due_date.present? && b.due_date < Date.today }
  end
end
