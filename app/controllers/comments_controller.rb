class CommentsController < ApplicationController
    
    def new
        @article = Article.find(params[:article_id])
        @comment = Comment.new(article_id: :article_id)
    end
    
    def create 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(comment_params)
        if @comment.save
            redirect_to article_path(@article.id)
        else
            render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to article_path(@article.id)
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article.id)
    end
    
    
    private
    
    def comment_params
        params[:comment].permit(:content)
    end
    
    
end
