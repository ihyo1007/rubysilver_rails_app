class UsersController < ApplicationController
  def mypage
    @total_answers = UserAnswer.where(user_id: current_user.id).count
    @correct_answers = UserAnswer.where(user_id: current_user.id, is_correct: true).count
  
    @accuracy =
      if @total_answers > 0
        ((@correct_answers.to_f / @total_answers) * 100).round(1)
      else
        0
      end
  end
  
end
