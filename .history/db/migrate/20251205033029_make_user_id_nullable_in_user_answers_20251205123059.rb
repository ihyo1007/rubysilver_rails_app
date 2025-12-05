class MakeUserIdNullableInUserAnswers < ActiveRecord::Migration[8.0]
  def change
    change_column :user_answers, :user_id, :integer, null: true
  end
end
