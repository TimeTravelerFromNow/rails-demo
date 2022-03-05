Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: "visitors/articles#index"
  get '/articles/:id' => 'visitors/articles#show', as: :blog_post

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
