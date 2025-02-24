Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Redirect logged-in users to books#index
  authenticated :user do
    root "books#index", as: :authenticated_root
  end

  # Redirect guests to login page
  unauthenticated do
    root "pages#home", as: :unauthenticated_root
  end

  resources :books do
    member do
      patch :borrow
      patch :return_book
    end
  end

resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :borrowings, only: [ :index, :create ]

  # Ensure 'my_books' is correctly mapped
  get 'my_books', to: 'books#my_books' # Page for borrowed books
  get 'profile', to: 'pages#profile'
  get "available_books", to: "pages#available_books"
  get 'request_book', to: 'pages#request_book'
  get "home", to: "pages#home"
end