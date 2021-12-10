class User < ApplicationRecord
    validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :last_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :access_level, presence: true, inclusion: { in: %w[Viewer Registrar Admin] }
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 },
                        format: {with: VALID_EMAIL_REGEX }
                            
    has_secure_password
    
    def initials
    "#{first_name.first}#{last_name.first}".upcase 
  end
  
end