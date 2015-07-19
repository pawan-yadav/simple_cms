Rails.application.routes.draw do
  devise_for :users

  root :to => 'pages#show', :id => '1'
  get 'admin' => "admin/admin#index"
  get '/:id' => "pages#show", :as => "pagelink"
  get '/admin/style_guide' => "admin/admin#style_guide"
  get '/admin/menu' => "admin/menu#index"
  post '/pages/create_contact_form' => "pages#create_contact_form"


  namespace :admin do
  	resources :pages do
      collection do
        get 'destroy'
      end
    end
    resources :blog_posts do
      collection do
        get 'destroy'
      end
    end
    resources :contact_forms do
      collection do
        get 'destroy'
      end
    end
    resources :menu_items do
      collection do
        get 'move_up'
        get 'move_down'
        get 'destroy'
      end
    end
  end
 	
end
