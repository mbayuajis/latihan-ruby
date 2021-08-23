class ArticlesController < ApplicationController
  def index
    @articles = Author.all
  end
end
