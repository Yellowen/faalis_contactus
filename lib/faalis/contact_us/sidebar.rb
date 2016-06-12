class Faalis::Dashboard::Models::Sidebar
  def blog_entries
    menu I18n.t('faalis.page.dashboard.blog'), icon: 'fa fa-globe' do
      item(I18n.t('faalis.page.dashboard.posts'),
        model: 'Faalis::ContactUs::Post',
        url: Faalis::Engine.routes.url_helpers.dashboard_blog_posts_path)
      item(I18n.t('faalis.page.dashboard.categories'),
        model: 'Faalis::ContactUs::Category',
        url: Faalis::Engine.routes.url_helpers.dashboard_blog_categories_path)
    end
  end
end
