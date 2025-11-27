class ChangeChoiceIdNullableInUserAnswers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :user_answers, :choice_id, true
  end
end
