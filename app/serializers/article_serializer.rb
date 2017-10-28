class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :link
  belongs_to :user
  belongs_to :department
  has_many :topics
end
