Rails.application.routes.draw do


  resources :pics do
    member do
      put :like, to: 'pics#upvote'
      put :dislike, to: 'pics#downvote'
    end
  end
  devise_for :users , path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  get  'pages/showcase', to: 'pages#showcase' , as: 'showcase'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
