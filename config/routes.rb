Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users

  root to: "visitors/articles#index"
  get '/articles/:id' => 'visitors/articles#show', as: :blog_post
  get '/new/article' => 'authors/articles#new', as: :new_article

  scope module: 'authors' do
    get '/articles/:id' => 'authors/articles#edit', as: :article

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
