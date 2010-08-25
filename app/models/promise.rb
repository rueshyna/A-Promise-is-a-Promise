# == Schema Information
# Schema version: 20100821120230
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
#

class Promise < ActiveRecord::Base
   attr_accessible :when, :howlong, :check
end
