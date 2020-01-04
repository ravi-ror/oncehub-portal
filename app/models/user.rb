class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team, optional: true
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :chat_rooms_participations, class_name: 'ChatRoom' # shows all chatrooms where user was intivited as participant
  has_many :pointing_pokers, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :retros, dependent: :destroy
  has_many :retro_responses, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
