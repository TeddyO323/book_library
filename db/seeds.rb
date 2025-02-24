# Create Users
User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "Admin User"  # Add a name if required
  user.password = "password"
end

User.find_or_create_by!(email: "user@example.com") do |user|
  user.name = "Regular User"  # Add a name if required
  user.password = "password"
end

# Create Books
Book.find_or_create_by!(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
Book.find_or_create_by!(title: "To Kill a Mockingbird", author: "Harper Lee")

# Create Borrowings
user = User.find_by(email: "user@example.com")
book = Book.find_by(title: "The Great Gatsby")

if user && book
  Borrowing.find_or_create_by!(user: user, book: book, due_date: Date.today + 14.days)
end

puts "✅ Seeding complete!"
