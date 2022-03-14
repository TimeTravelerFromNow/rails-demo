module Authors
  class ElementsController < AuthorsController

    before_action :set_post
    before_action :set_element, only: %i[update destroy ]

    # POST /elements or /elements.json
    def create
      @element = @article.elements.build

      if @element.save
        notice = nil
      else
        notice = @element.errors.full_messages.join(". ") << "."
      end
      redirect_to edit_article_path(@article)
    end

    # PATCH/PUT /elements/1 or /elements/1.json
    def update
        if @element.update(element_params)
          redirect_to edit_article_path(@article)
        else
          redirect_to edit_article_path(@article)
        end

    end

    # DELETE /elements/1 or /elements/1.json
    def destroy
      @element.destroy
      redirect_to edit_article_path(@article)
    end

    private
      def set_post
        @article = Article.find(params[:article_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = @article.elements.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def element_params
        params.require(:element).permit(:element_type, :content, :article_id, :position)
      end
  end
end
