Rails.application.routes.draw do

  resources:books
  root to: 'homes#top'

  patch 'books/:id' => 'books#update', as: 'update_list'

  delete 'books/:id' => 'books#destroy', as: 'destroy_list'
end
