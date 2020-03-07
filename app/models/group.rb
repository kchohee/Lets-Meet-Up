class Group < ActiveRecord::Base
    has_many :users

    # scope :all_except_current_user {where.not(user_id: current_user.id)}
end
