class CreateArticleTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :article_topics do |t|
      t.belongs_to :article, index: true, foreign_key: true
      t.belongs_to :topic, index: true, foreign_key: true
      t.text :comment
      t.string :article_name
      t.timestamps
    end
  end
end
