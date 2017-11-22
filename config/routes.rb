Rails.application.routes.draw do
	resources :contacts
	resources :blog_posts
	resources :contacts
	resources :properties
	resources :meetups
	root 'home#index'
	post 'update_last_contacted' => 'contacts#update_last_contacted'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
