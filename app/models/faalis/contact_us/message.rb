# == Schema Information
#
# Table name: faalis_blog_posts
#
#  id               :integer          not null, primary key
#  title            :string
#  permalink        :string
#  raw_content      :text
#  content          :text
#  category_id      :integer          not null
#  published        :boolean
#  user_id          :integer          not null
#  views            :integer          default(0)
#  likes            :integer          default(0)
#  dislikes         :integer          default(0)
#  allow_comments   :boolean          default(TRUE)
#  members_only     :boolean          default(FALSE)
#  meta_title       :string
#  meta_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  domain_id        :integer
#

module Faalis::ContactUs
  class Message < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    before_save :render_content

    belongs_to :user, class_name: 'Faalis::User'

    scope :ordered, -> { order('created_at DESC') }


    validates_presence_of :name, :email, :exteradata
    validates_format_of :email, :with => /.+@.+\..+/i


    private

    def render_content
      unless raw_content.blank?
        markdown = ::Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
        self.content  = markdown.render(raw_content)
      end
    end
  end
end
