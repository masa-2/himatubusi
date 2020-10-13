class AddUrlToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :url, :string
  end
end
