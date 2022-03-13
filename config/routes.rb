Rails.application.routes.draw do
  resources :elements
  devise_for :users

  root to: "visitors/articles#index"
  get '/articles/:id' => 'visitors/articles#show', as: :blog_post
  get '/new/article' => 'authors/articles#new', as: :new_article

  scope module: 'authors' do
    get '/articles/:id' => 'authors/articles#edit', as: :article

    resources :articles do
          resources :comments do
        member do
          get :makepublic
        end
      end
    end
  end

end
