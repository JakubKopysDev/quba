Rails.application.routes.draw do
	root 'main_page#home'
	get 		'top_list' 	=> 'main_page#top_list'
	get 		'sign_up' 	=> 'users#new'
	get 		'posts/new'
	get			'posts/show'
	get 		'login'			=> 'sessions#new'
	post 		'login'			=> 'sessions#create'
	delete 	'logout'		=> 'sessions#destroy'
	resources :users
	resources :posts do
		member do
			post 'like'
		end
		resources :comments, :only => [:create]
	end
end
