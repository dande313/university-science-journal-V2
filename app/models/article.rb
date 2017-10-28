class Article < ApplicationRecord
	belongs_to :user
	delegate :department, to: :user
	has_many :article_topics, :dependent => :destroy
	has_many :topics, through: :article_topics
	validates :name, presence: true, uniqueness: true

	def topics_attributes=(topic_attributes)
	    topic_attributes.values.each do |topic_attribute|
	    	if !topic_attribute[:name].empty?
		      topic= Topic.find_or_create_by(topic_attribute)
		      self.topics << topic unless self.topics.include?(topic)
		    end
	    end
	end
end
