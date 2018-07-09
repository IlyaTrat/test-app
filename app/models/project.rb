class Project < ApplicationRecord
    has_many :tasks
    validates :name, presence: true, uniqueness: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_greater_than_start_date

    def start_date_cannot_be_in_the_past
        errors.add(:start_date, "can't be in the past") if
            !start_date.blank? and start_date < Date.today
    end

    def end_date_cannot_be_greater_than_start_date
        errors.add(:end_date, "can't be greater than start date") if
            end_date < start_date
    end
end
