class AddChoiceIdsToUserAnswers < ActiveRecord::Migration[8.0]
  def change
    add_column :user_answers, :choice_ids, :text
  end
end
