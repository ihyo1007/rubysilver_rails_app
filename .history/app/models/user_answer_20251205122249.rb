class UserAnswer < ApplicationRecord
  belongs_to :user, optional : true
  belongs_to :question
  belongs_to :choice , optional: true 
end
