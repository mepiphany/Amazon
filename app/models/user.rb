class User < ActiveRecord::Base
  validates :email, presence: true,
                    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                    uniqueness: true

  validates :password, length: { minimum: 6}

  has_secure_password

end
