class ArticlesController < ApplicationController
    
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
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    
    private
    
    def article_params
        params[:article].permit(:title, :content)
    end

end

