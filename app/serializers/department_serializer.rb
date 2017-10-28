class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users
  has_many :articles
  has_many :topics
end
