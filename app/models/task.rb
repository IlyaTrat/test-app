class Task < ApplicationRecord
    belongs_to :project
    belongs_to :user
    validates :title, presence: true, uniqueness: true
    validates :status, acceptance: { accept: ['new','in progress','done'] }
    validates :user_id, presence: true
    validates :project_id, presence: true
end
