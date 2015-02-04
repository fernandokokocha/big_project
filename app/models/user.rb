class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :team

  acts_as_messageable

  def name
    email
  end

  def mailboxer_email(object)
    nil
  end

  def to_s
    email
  end
end
