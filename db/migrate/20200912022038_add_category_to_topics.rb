class AddCategoryToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :topic_category_id, :integer
  end
end
