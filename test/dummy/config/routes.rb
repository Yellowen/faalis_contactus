Rails.application.routes.draw do

  get 'welcome/index'

  mount Faalis::Engine => '/'

  api_routes do
    # Your API routes goes here.
  end

  in_dashboard do
    # Your dashboard routes goes here.
  end

  sites(self) do
    mount Faalis::Blog::Engine => "/"
  end

  root 'welcome#index'
end
