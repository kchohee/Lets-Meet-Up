class User < ActiveRecord::Base
    belongs_to :group
    has_many :posts
    has_secure_password
    validates_uniqueness_of :email
end
