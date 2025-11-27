class AddMultipleAnswerToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :multiple_answer, :boolean
  end
end
