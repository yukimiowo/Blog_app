class Article < ActiveRecord::Base
    has_many :comments
    validates :title, presence: { message: "を入力してください" }
    validates :content, presence: { message: "を入力してください" }
end
