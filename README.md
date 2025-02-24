# 📚 Book Lending Library

A **Ruby on Rails 8** web application for managing a book lending system. Users can **browse, borrow, and return books**, with a simple authentication system to track user activity.

## 🚀 Features
- **User Registration & Login** (currently using Devise)
- **Book Listing & Details**
- **Book Borrowing System** (with availability tracking)
- **User Profile & Borrowed Books List**
- **Basic Authentication System** (static login for now)
- **SQLite Database** (default for Rails development)
- **Styled UI with Bootstrap**

---

## 📦 Installation

### **1️⃣ Prerequisites**
Before setting up the project, install the following:

| Software | Installation Guide |
|----------|------------------|
| Ruby | [Download & Install Ruby](https://www.ruby-lang.org/en/downloads/) |
| SQLite | Comes pre-installed with Ruby on Windows & Linux. If missing, install via: `sudo apt install sqlite3` (Linux) or `brew install sqlite3` (Mac) |
| Rails | Install via `gem install rails` |
| Git | [Download & Install Git](https://git-scm.com/downloads) |

Check if they are installed:
```sh
ruby -v      # Check Ruby version
rails -v     # Check Rails version
sqlite3 --version  # Check SQLite version
git --version  # Check Git version
```

---

### **2️⃣ Clone the Repository**
```sh
git clone https://github.com/TeddyO323/book_library.git
cd book_library
```

---

### **3️⃣ Install Dependencies**
Run the following command to install all required Ruby gems:

```sh
bundle install
```

---

### **4️⃣ Setup the Database**
Run the following command to set up the SQLite database:

```sh
rails db:migrate
```

If needed, seed the database with initial data:
```sh
rails db:seed
```

---

## ▶️ Running the Application

### **Start the Rails Server**
Use the following command depending on your OS:

#### **For Linux/macOS**
```sh
rails server
```

#### **For Windows (Command Prompt)**
```cmd
rails server
```

#### **For Windows (PowerShell)**
```powershell
rails server
```

After starting the server, open your browser and visit:  
➡️ **http://localhost:3000**

---

## 📚 Adding Books (Manual Method)
Since there's **no admin panel yet**, books must be added manually.

### **Option 1: Using Rails Console**
Run the Rails console:
```sh
rails console
```
Then, insert books manually:
```ruby
Book.create!(
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  isbn: "9780743273565",
  published_year: 1925,
  genre: "Classic",
  pages: 180,
  publisher: "Charles Scribner's Sons",
  language: "English",
  format: "Hardcover",
  description: "A novel about the American dream."
)
```
Exit the console using:
```ruby
exit
```

---

## 🔧 Common Errors & Fixes

### **1️⃣ `rails` command not found**
#### Cause: Ruby or Rails not installed properly.
#### Fix:
```sh
gem install rails
```

### **2️⃣ Server Port Already in Use**
#### Fix: Run the server on a different port
```sh
rails server -p 3001
```

### **3️⃣ Database Errors**
#### Fix: Reset and migrate the database
```sh
rails db:drop db:create db:migrate
```

---

## 🧪 Running Tests (If Applicable)
Run the default Rails test suite:
```sh
rails test
```

---

## 📜 License
This project is **open-source** under the **MIT License**.

---

## 📬 Contact
For issues or suggestions, feel free to open an issue on GitHub. 🚀

Here's the updated README with a **"To Be Added Soon"** section:

---

## 🛠️ To Be Added Soon
Here are some planned features for future updates:

- **📌 Admin Panel** → Allowing administrators to add, edit, and delete books.
- **📌 Borrowing History** → Users will be able to track their past borrowed books.
- **📌 Due Date Reminders** → Notify users when their borrowed books are due.
- **📌 Enhanced Search & Filters** → Improve book searching and filtering options.
- **📌 Fine System** → Implement late return fines for overdue books.
- **📌 User Reviews & Ratings** → Allow users to review and rate books.

---

## 📜 License
This project is **open-source** under the **MIT License**.

---

## 📬 Contact
For issues or suggestions, feel free to open an issue on GitHub. 🚀

---
