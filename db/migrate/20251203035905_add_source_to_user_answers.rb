class AddSourceToUserAnswers < ActiveRecord::Migration[8.0]
  def change
    add_column :user_answers, :source, :string
  end
end
