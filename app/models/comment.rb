class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, presence: true, length: { maximum: 200, minimum: 4 }
  default_scope -> { order(created_at: :desc) }
end
