json.extract! question, :id, :id, :content, :question_id, :is_correct, :answered_at, :created_at, :updated_at
json.url question_url(question, format: :json)
