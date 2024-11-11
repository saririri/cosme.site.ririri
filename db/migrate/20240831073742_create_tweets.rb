class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :genre
      t.text :text
      t.integer :user_id

      t.timestamps

    end
    
  end
end
