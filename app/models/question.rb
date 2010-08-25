# == Schema Information
# Schema version: 20100821120230
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  question   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
 attr_accessiable :question
end
