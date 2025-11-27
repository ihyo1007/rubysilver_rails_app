class AddCategoryToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :category, :string
  end
end
