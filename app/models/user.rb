class User < ActiveRecord::Base

  attr_accessor   :password

  validates_uniqueness_of   :email 
  validates_presence_of     :password, on: :create
  validates_confirmation_of :password
  before_save               :encrypt_password
 
  def self.authenticate(email, password) 
    user = find_by_email(email)
    if user and user.password_hash == self.hash_secret(password, user.password_salt)
      return user
    end
  end
     
  private

  def encrypt_password
    if self.password.present?
      self.password_salt = get_salt
      self.password_hash = hash_secret(self.password, self.password_salt)
    end
  end
 
  def get_salt
    BCrypt::Engine.generate_salt
  end

  def self.hash_secret(password, salt)
    BCrypt::Engine.hash_secret(password, salt)
  end

  
end
