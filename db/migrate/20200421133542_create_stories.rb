class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :user_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
