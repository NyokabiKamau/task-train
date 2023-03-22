class User < ApplicationRecord
    has_secure_password

    validates :username, { 
        length: { minimum: 5, maximum: 8 }, 
        uniqueness: true,
        presence: true
    }

    validates :email, {
        presence: true,
        uniqueness: true
    }
end