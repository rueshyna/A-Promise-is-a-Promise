# == Schema Information
# Schema version: 20100830064335
#
# Table name: promises
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  when        :string(255)
#  howlong     :integer
#  score       :string(255)
#  happen      :string(255)
#  improvement :string(255)
#  evaluation  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  start       :string(255)
#  end         :string(255)
#  allDay      :boolean
#  className   :string(255)
#

class Promise < ActiveRecord::Base
   attr_accessible :when, :howlong, :title, :start, :end, :allDay, :className, :score, :happen, :improvement, :evaluation

  belongs_to :user
end
