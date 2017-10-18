module ArticlesHelper

    def can_edit?
      if !current_user.nil?
        !!((current_user.professor? && current_user.department == @article.user.department) || @article.user == current_user)
      end
    end
end
