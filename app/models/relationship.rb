# == Schema Information
# Schema version: 20101010102123
#
# Table name: relationships
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Relationship < ActiveRecord::Base
  attr_accessible :group_id
  belongs_to :user
  belongs_to :group

end
