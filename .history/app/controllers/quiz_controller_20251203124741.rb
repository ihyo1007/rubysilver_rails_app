class QuizController < ApplicationController

  # ホーム画面
  def home
  end
 
  # ランダム出題
  def random
    @question = Question.order("RANDOM()").first
  end

   # 回答処理
  def answer
    @question = Question.find(params[:question_id])

    selected_ids = params[:choice_ids]&.map(&:to_i) || []
    correct_ids  = @question.choices.where(is_correct: true).pluck(:id)

    @is_correct = (selected_ids.sort == correct_ids.sort)

    # ユーザーの回答を保存
    UserAnswer.create!(
      user_id: current_user.id,   # ログイン中のユーザーID
      question_id: @question.id,
      is_correct: @is_correct
    )

    # 結果画面へリダイレクト
    render "quiz/result"
  end
  
  

  # 結果表示
  def result
    @question = Question.find(params[:question_id])
    @is_correct = params[:correct] == "true"
  end
  
end
