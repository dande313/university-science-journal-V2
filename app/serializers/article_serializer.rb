class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :link
end
