class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
         gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates_presence_of :username
         validates_uniqueness_of :username
         has_many :pics , dependent: :destroy

         
end
