module Faalis::Blog
  class PostPolicy < ::ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end