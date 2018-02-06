module Admin
  class ArticlesController < Admin::ApplicationPageController
    prepend_before_action do
      set_model Article
    end

    def create
      super article_params
    end

    def update
      super article_params
    end

    protected
      def article_params
        if policy(@article || Article).update_structure?
          params.fetch(:article, {}).permit(
            :title, :slug, :category_id, :priority,
            sections_attributes: Admin::ApplicationPageController::ALL_SECTION_ATTRIBUTES
          )
        else
          params.fetch(:article, {}).permit(
            :title, :slug,
            sections_attributes: Admin::ApplicationPageController::TRANSLATABLE_SECTION_ATTRIBUTES
          )
        end
      end

  end
end
