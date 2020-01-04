class ChatRoom < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :participants, class_name: "User"
  has_many :messages, dependent: :destroy

  def add_participants users
    self.participants << users
  end
end
