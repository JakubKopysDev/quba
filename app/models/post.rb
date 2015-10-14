class Post < ActiveRecord::Base
  belongs_to :user
	before_save { title.upcase! }
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :avatar, attachment_presence: true
	validates_attachment :avatar, content_Type: { content_type: ["image/jpeg",
																								"image/png", "image/gif"] }
	validates :title, presence: true, length: { maximum: 30, minimum: 4 }
	has_attached_file :avatar, styles: { large: "600x", medium: "300x300>",
																			 thumb: "100x100>" },
														 default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	validate :avatar_size

	def feed
		posts
	end

	private

		# Validates the size of an uploaded image.
		def avatar_size
			unless avatar.size.nil?
				if avatar.size > 5.megabytes
					errors.add(:picture, "should be less than 5MB")
				end
			end
		end

end
