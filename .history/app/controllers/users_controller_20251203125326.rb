class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage
    @total_answers = UserAnswer.where(user_id: current_user.id).count
    @correct_answers = UserAnswer.where(user_id: current_user.id, is_correct: true).count
  
    @accuracy =
      if @total_answers > 0
        ((@correct_answers.to_f / @total_answers) * 100).round(1)
      else
        0
      end
    @total_answers2 = User2Answer.where(user_id: current_user.id).count
    @correct_answers2 = User2Answer.where(user_id: current_user.id, is_correct: true).count
  
    @accuracy2 =
      if @total_answers2 > 0
        ((@correct_answers2.to_f / @total_answers2) * 100).round(1)
      else
        0
      end
    
  end
  
end
