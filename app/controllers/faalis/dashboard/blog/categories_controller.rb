class Faalis::Dashboard::Blog::CategoriesController < ::Dashboard::ApplicationController
  engine 'Faalis::Engine'
  namespace 'blog'

  in_form do |list|
    list.attributes except: [:site, :user]
  end
end
