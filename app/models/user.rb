class User < ActiveRecord::Base
  # TODO: put comments to specify the differences between the following three
  # roles
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         # :recoverable, 
         :rememberable, :trackable, :validatable
end
