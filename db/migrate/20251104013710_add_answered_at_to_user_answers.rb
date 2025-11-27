class AddAnsweredAtToUserAnswers < ActiveRecord::Migration[8.0]
  def change
    add_column :user_answers, :answered_at, :datetime
  end
end
