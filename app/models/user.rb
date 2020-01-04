class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team, optional: true
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :chat_rooms_participations, class_name: 'ChatRoom' # shows all chatrooms where user was intivited as participant
  has_many :pointing_pokers, dependent: :destroy
  has_many :points, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
