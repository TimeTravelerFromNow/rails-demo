module Authors
  class ElemsController < AuthorsController

    before_action :set_post
    before_action :set_elem, only: [:update, :destroy ]

    # POST /elems or /elems.json
    def create
      @elem = @article.elems.build

      if @elem.save
        notice = nil
      else
        notice = @elem.errors.full_messages.join(". ") << "."
      end
      redirect_to edit_article_path(@article)
    end

    # PATCH/PUT /elems/1 or /elems/1.json
    def update
        @elem.update(elem_params)
        redirect_to edit_article_path(@elem.article)
    end

    # DELETE /elems/1 or /elems/1.json
    def destroy
      @elem.destroy
      redirect_to edit_article_path(@elem.article)
    end

    private
      def set_post
        @article = Article.find(params[:article_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_elem
        @elem = @article.elems.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def elem_params
        params.require(:elem).permit(:element_type, :content)
      end
  end
end
