Faalis::Routes.draw(::Faalis::ContactUs::Engine) do

  plugin do
    get "#{Faalis::ContactUs::Engine.messages_url_prefix}", to: 'messages#index', as: :ContactUs
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
