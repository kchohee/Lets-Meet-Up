class Group < ActiveRecord::Base
    has_and_belongs_to_many :users

    scope :all_except_current_user { where.not(user_id: current_user.id) }
end
