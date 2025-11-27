class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.text :content, null: false
      t.integer :question
      t.boolean :is_correct
      t.datetime :answered_at

      t.timestamps
    end
  end
end
