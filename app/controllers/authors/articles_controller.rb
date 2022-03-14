module Authors
  class ArticlesController < AuthorsController
    before_action :set_post, only: %i[edit update destroy ]

    def index
     @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to edit_article_path(@article)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @paragraph = @article.elements.build(element_type: 'paragraph')
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to edit_article_path(@article)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path, status: :see_other
    end

    private
      def set_post
        @article = Article.find(params[:id])
      end

     def article_params
       params.require(:article).permit(:title, :body, :status, :header_image)
     end
  end
end
