Faalis::Routes.draw(::Faalis::ContactUs::Engine) do

  plugin do
    get "#{Faalis::ContactUs::Engine.posts_url_prefix}", to: 'messages#index', as: :index
    get "#{Faalis::ContactUs::Engine.posts_url_prefix}/:permalink", to: 'message#show', as: :post_show
    get "#{Faalis::ContactUs::Engine.categories_url_prefix}/:permalink", to: 'categories#show', as: :category_show
  end

  faalis do
    in_dashboard do
    resources :messages |app|
      namespace :blog do
        resources :categories
        resources :posts
      end
    end
  end
end
