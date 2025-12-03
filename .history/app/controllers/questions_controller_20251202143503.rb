class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.order(:id).page(params[:page]).per(20) rescue Question.all
    if params[:q].present?
      @questions = @questions.where("title ILIKE ? OR description ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end
    @questions = @questions.by_category(params[:category]) if params[:category].present?
    @categories = Question.all_categories  # 重複なしのカテゴリ一覧を取得
  end

  def show
    @question = Question.includes(:choices).find(params[:id])  # choicesを先読み
    @user_answer = UserAnswer.new  # form_with 用
  end

  def answer
    @question = Question.includes(:choices).find(params[:id])  # choicesを先読み
    selected_ids = params[:choice_ids]&.map(&:to_i) || []

    correct_ids = @question.choices.where(is_correct: true).pluck(:id)
    @is_correct = (selected_ids.sort == correct_ids.sort)
    @next_question = Question.where("id > ?", @question.id).order(:id).first
    @previous_question = Question.where("id < ?", @question.id).order(id: :desc).first

    render :result
  end
  # GET /questions/new
  def new
    @question = Question.new
    5.times { @question.choices.build }  # 選択肢を4つ作成
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    (4 - @question.choices.size).times { @question.choices.build }  # 選択肢が4つになるように追加
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_path, notice: "Question was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy!

    respond_to do |format|
      format.html { redirect_to questions_path, notice: "Question was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content, :explanation, :multiple_answer,
        choices_attributes: [ :id, :content, :is_correct, :_destroy ])
    end
end
