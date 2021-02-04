class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenges, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :votes, dependent: :destroy


  def self.remove_user(user_id)
    user = User.find(user_id.to_i)
    if   user.destroy
      return(1)
    end
    return(0)
  end
end
