class User < ApplicationRecord
  extend Devise::Models
  
  # associations
  has_one :donor
  has_one :keeper
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  # role check methods
  # only needed so checking associated models return false value instead of nil
  def donor?
    self.donor ? true : false
  end

  def keeper?
    self.keeper ? true : false
  end

  # create methods
  def build_new_donor
    if self.donor.nil?
    self.build_donor(
      first_name: self.first_name, 
      last_name: self.last_name, 
      email: self.email
    )
    end
    self.donor # ensure the donor is returned regardless if it was created or previously existed
  end

  

  # method copy/pasted, check that it works and tweak
  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end

end
