module Faalis
  module ContactUs
    class Engine < ::Rails::Engine
      isolate_namespace Faalis::ContactUs

      engine_name 'faalis_blog'

      mattr_accessor :posts_url_prefix do
        'posts'
      end

      mattr_accessor :categories_url_prefix do
        'categories'
      end

      mattr_accessor :default_layout do
        'blog'
      end

    end
  end
end
