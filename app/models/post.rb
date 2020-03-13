class Post < ActiveRecord::Base
    belongs_to :user
    validates :content, :length=>{:minimum=>5, :maximum=>500}, :presence=>true
end
