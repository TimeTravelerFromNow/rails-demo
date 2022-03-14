module Authors
  class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      if @comment.public?
        @comment.update(status: 'pending')
      else
        @comment.update(status: 'private')
      end

      @comment.update(commenter: current_user.email)
      redirect_to article_path(@article)
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to edit_article_path(@article), status: 303
    end

    def makepublic
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      if @comment.public?
        @comment.update(status: 'archived')
      else
        @comment.update(status: 'public')
      end
      redirect_to edit_article_path(@article), status: 303
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
  end
end
