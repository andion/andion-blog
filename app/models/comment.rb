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
  before_save :nullify_blanks
  
  validates_presence_of :content
  
  validates_each :author, :content, :allow_blank => true, :allow_nil => true do |record, attr, value|
    blames = Comment.blame_words_regexp
    if value =~ blames
      record.errors.add(attr,
        "contains a blame. Please calm down, relax, and come again later.") 
    end
  end  

  # Modifying utility scopes default ordering
  ordered_by 'created_at ASC'

  #
  # Returns the author name or anonymous
  #
  def author_name
    self.author ? "- #{self.author}" : 'Anonymous'
  end
  
  protected
  
  #
  # Returns a regular expression of words you don't allow in posts
  #
  def self.blame_words_regexp
    Regexp.new('fuck|ass|shit|silly|moron|puta|cabrón|gilipollas|mamón|imbécil')
  end
  
  #
  # Ensure thath we have nil and not empty strings in BBDD
  # TODO: why is not necessary
  #
  def nullify_blanks
    self.author = nil if author.blank?
  end
  
end
