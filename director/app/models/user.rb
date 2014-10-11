class User < ActiveRecord::Base
  has_many :user_answers
  
  validates :email, presence: true

  include TokenAuthenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :ensure_authentication_token

end
