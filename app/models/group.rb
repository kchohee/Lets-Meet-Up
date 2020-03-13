class Group < ActiveRecord::Base
    has_many :users
    validates :bio, :length =>{:maximum=>500, :too_long=>"%{count} characters is the maximum allowed"}, :presence=>true
    validates :name, :length=>{:minimum=>2, :maximum=>50}, :presence=>true
end
