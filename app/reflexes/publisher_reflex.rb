# frozen_string_literal: true

class PublisherReflex < ApplicationReflex

  def publish
    article = Article.find(element.dataset[:article_id])
    article.update(status: "public")
  end

  def unpublish
    article = Article.find(element.dataset[:article_id])
    article.update(status: "private")
  end
end
