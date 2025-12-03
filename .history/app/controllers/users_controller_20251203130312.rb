class UsersController < ApplicationController
  def mypage
    @list_total_answers = UserAnswer.where(user_id: current_user.id, source: "list").count
    @list_correct_answers = UserAnswer.where(user_id: current_user.id, is_correct: true).count
  
    @list_accuracy =
      if @list_total_answers > 0
        ((@list_correct_answers.to_f / @list_total_answers) * 100).round(1)
      else
        0
      end
  end
  
end
