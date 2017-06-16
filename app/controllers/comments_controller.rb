class CommentsController < ApplicationController
    
    before_action :set_article, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_comment, only: [:edit, :update, :destroy]
    
    
    def new
        @comment = Comment.new(article_id: :article_id)
    end
    
    def create 
        @comment = @article.comments.new(comment_params)
        if @comment.save
            redirect_to article_path(@article.id)
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @comment.update(comment_params)
            redirect_to article_path(@article.id)
        else
            render 'edit'
        end
    end
    
    def destroy
        @comment.destroy
        redirect_to article_path(@article.id)
    end
    
    
    private
    
        def comment_params
            params[:comment].permit(:content)
        end
        
        def set_article
            @article = Article.find(params[:article_id])
        end
        
        def set_comment
            @comment = Comment.find(params[:id])
        end
    
    
end
