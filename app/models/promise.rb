# == Schema Information
# Schema version: 20100830064335
#
# Table name: promises
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  question_id :integer
#  when        :string(255)
#  howlong     :integer
#  check       :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#  start       :string(255)
#  end         :string(255)
#

class Promise < ActiveRecord::Base
   attr_accessible :when, :howlong, :check, :title, :start, :end, :allDay
end
