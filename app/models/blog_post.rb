class BlogPost < ApplicationRecord
	validates :title, :blog_entry, presence: true
	validates :title, uniqueness: true, length: { maximum: 140}

	has_many :comments
	belongs_to :user
end
