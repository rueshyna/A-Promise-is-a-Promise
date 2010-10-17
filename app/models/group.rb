# == Schema Information
# Schema version: 20101010052826
#
# Table name: groups
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  group      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  attr_accessible :group

  belongs_to :user
  has_many :user

  validates_presence_of :group
  validates_length_of :group , :maximum => 50
  validates_uniqueness_of :group, :case_sensitive => false

end
