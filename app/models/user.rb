class User < ApplicationRecord

  has_many :notes, dependent: :destroy

  enum role: {
    user: 0,
    admin: 1
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
