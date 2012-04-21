# == Schema Information
#
# Table name: paragraphs
#
#  id         :integer         not null, primary key
#  prev_id    :integer
#  next_id    :integer
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Paragraph < ActiveRecord::Base
  has_one :prev, :foreign_key => "next_id", :class_name => "Paragraph"
  has_one :next, :foreign_key => "prev_id", :class_name => "Paragraph"
  
  attr_accessible :body
end
