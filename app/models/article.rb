class Article < ActiveRecord::Base
    validates :title, presence: { message: "タイトルを入力してください" }
    validates :content, presence: { message: "内容を入力してください" }
end
