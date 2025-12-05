class UserAnswer < ApplicationRecord
  belongs_to :user optional
  belongs_to :question
  belongs_to :choice , optional: true 
end
