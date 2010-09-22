# == Schema Information
# Schema version: 20100830064335
#
# Table name: promises
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  when       :string(255)
#  howlong    :integer
#  check      :string(255)
#  commits    :string(255)
#  evaluation :string(255)
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  start      :string(255)
#  end        :string(255)
#  allDay     :boolean
#

class Promise < ActiveRecord::Base
   attr_accessible :when, :howlong, :check, :title, :start, :end, :allDay, :commits, :evaluation
end
