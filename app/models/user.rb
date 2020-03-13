class User < ActiveRecord::Base
    belongs_to :group
    has_many :posts
    has_secure_password
    validates_uniqueness_of :email
    validates :name, :format =>{:with=>/\A[a-zA-Z]+\z/, :message => "Only letters allowed"}, :length =>{:minimum => 2}, :presence=>true
end
