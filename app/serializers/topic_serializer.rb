class TopicSerializer < ActiveModel::Serializer
  attributes :name
  has_many :articles
end
