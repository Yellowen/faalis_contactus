Faalis::Routes.draw(::Faalis::Blog::Engine) do

  plugin do
    get "#{Faalis::Blog::Engine.posts_url_prefix}", to: 'posts#index', as: :index
    get "#{Faalis::Blog::Engine.posts_url_prefix}/:permalink", to: 'posts#show', as: :post_show
    get "#{Faalis::Blog::Engine.categories_url_prefix}/:permalink", to: 'categories#show', as: :category_show
  end

  faalis do
    in_dashboard do |app|
      namespace :blog do
        resources :categories
        resources :posts
      end
    end
  end
end
