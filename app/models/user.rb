class User < ActiveRecord::Base
    belongs_to :groups
    has_many :post
    has_secure_password
end
