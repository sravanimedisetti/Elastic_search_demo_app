class ArticlesController < ApplicationController
  def new
  	@article = Article.new
  end

  def index
   if params[:query].present?
      @articles = Article.search params[:query]
      binding.pry
    else
      @articles = Article.all
    end
  end 

=begin
  def autocomplete
    binding.pry
    render json: Article.search(params[:query], {
      fields: ["name^5", "description"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
  end
=end
=begin
  def typeahead
  render json: Article.search(params[:query], {
    fields: ["name"],
    limit: 10,
    load: false,
    misspellings: {below: 5},
  }).map do |article| { title: article.name, value: article.id } end
    binding.pry
end
=end
 
  def show
    @article = Article.find(params["id"])
  end

  def create
  	@article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def search 
  end
  def destroy
       @article = Article.find(params[:id])
       @article.destroy
       redirect_to articles_path
  end

  def update
     @article = Article.find(params[:id])
     @article.update(article_params)
     redirect_to @article
  end

  def edit
     @article = Article.find(params["id"])
  end
  private
    def article_params
      params.require(:article).permit(:name,:description)
    end
end
