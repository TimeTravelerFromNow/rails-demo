module Visitors
  class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      if @comment.public?
        comment.update(status: 'pending')
      end
      redirect_to article_path(@article)
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
  end
end
