class Comment < ApplicationRecord

	belongs_to :blog_post

	validates :comments_entry, :blog_post_id, presence: true
end


