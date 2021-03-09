class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true


  def authenticate_with_credentials email, password
    # find email and password. If it exists, return user, if not null
    if User.exists?(:email => email, :password => password)
      User.where(:email => email, :password => password)
    else
      nil
    end
  end

end
