Rails.application.routes.draw do 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tweets/top' => 'tweets#top'
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :perfumes
  resources :dogs
  root 'tweets#top'
  delete 'tweets/:id' => 'tweets#destroy'
end
