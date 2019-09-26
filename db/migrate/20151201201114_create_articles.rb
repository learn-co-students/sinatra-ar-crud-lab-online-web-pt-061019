class CreateArticles < ActiveRecord::Migration[5.1]
  def up
    create_table :articles do |t|
      t.string :title
      t.string :content
    end
  end

  def down 
    drop_table :articles
  end
end
