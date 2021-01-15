class CreateArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :article_categories do |t|
      t.integer :category_id
      t.integer :article_id

    end
  end
end
