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

require 'spec_helper'

describe Paragraph do
  pending "add some examples to (or delete) #{__FILE__}"
end
