class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :admin, default: false, uniqueness: false, acceptance: { accept: [true, false] }
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_many :tasks
end
