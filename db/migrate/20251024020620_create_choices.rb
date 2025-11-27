class CreateChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :choices do |t|
      t.string :name
      t.references :question, null: false, foreign_key: true
      t.boolean :is_correct
      t.string :content

      t.timestamps
    end
  end
end
