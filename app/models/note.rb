class Note < ApplicationRecord
  belongs_to :user

  encrypts :content

  validates :title, presence: true
  validates :content, presence: true
end
