class Article < ActiveRecord::Base
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

	belongs_to :user
	scope :published, -> { where("published_at <= ? AND published = ?", Time.now, true) }

	def slug_candidates
		[
			:title,
			[ :created_at, :title ] 
		]
	end

end
