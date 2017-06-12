class Comment < ActiveRecord::Base
  belongs_to :article
  validates :content, presence: { message: "内容を入力してください" }
end
