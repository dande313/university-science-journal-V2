class Topic < ApplicationRecord
  has_many :article_topics
  has_many :articles, through: :article_topics
  belongs_to :department
  validates :name, presence: true, uniqueness: true

  attr_accessor :comment, :article_name, :article_id
end
