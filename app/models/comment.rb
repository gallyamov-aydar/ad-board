class Comment < ApplicationRecord
	belongs_to :ad

	belongs_to :user

	has_attached_file :image, :styles => { :medium => "200x200>" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates_length_of :message, :maximum => 300

	default_scope { order(id: :asc) }
end
