# == Schema Information
# Schema version: 20090111235715
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  author     :string(255)
#  content    :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :content
end
