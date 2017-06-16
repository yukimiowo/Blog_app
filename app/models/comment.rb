class Comment < ActiveRecord::Base
  belongs_to :article
  validates :content, presence: { message: "を入力してください" }
end
