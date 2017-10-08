Rails.application.routes.draw do
  resources :blog_posts
	resources :contacts
	resources :properties
	resources :meetups
	root 'home#index'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
