class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: { manager: 0, developer: 1, q_a: 2 }

  has_many :bugs
  has_many :project_users
  has_many :projects, through: :project_users
  
  
  validates :email, presence: true
  validates :role, presence: true
  validates :encrypted_password, presence: true
  
end
