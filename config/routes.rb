Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users

  root to: "visitors/articles#index"
  get '/articles/:id' => 'visitors/articles#show', as: :blog_post
  get '/certs/:id' => 'visitors/certs#show', as: :certificate

  get '/new/article' => 'authors/articles#new', as: :new_article
  get '/new/cert' => 'authors/certs#new', as: :new_certificate

  scope module: 'authors' do
    get '/articles/:id' => 'authors/articles#edit', as: :article
    get '/certs/:id' => 'authors/certs#edit', as: :certpanel
    resources :certs
    resources :articles do


              resources :elements
              resources :comments do
          member do
            get :makepublic
          end
        end
      end
  end

end
