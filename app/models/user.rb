class User < ApplicationRecord
  acts_as_voter
  has_attached_file :image, styles: { medium: "640x"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, length: { minimum: 4, maximum: 16}, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
