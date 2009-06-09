# == Schema Information
# Schema version: 20090111235715
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title

  named_scope :in_one_month, lambda { |date|
    {:conditions =>
      {:created_at => date.at_beginning_of_month..date.at_end_of_month}
  }}

  #
  # Default will_paginate's per page
  #
  def self.per_page
    10
  end

  #
  # Adds a comment to a post
  #
  def add_comment(comment)
    self.comments << comment
  end

  #
  # Returns the number of comments of this post
  #
  def number_of_comments
    self.comments.length
  end

  #
  # Returns true if it's a contentless post false otherwise
  #
  def has_content?
    self.content ? true : false
  end

  def self.posts_and_comments_per_month_graph(number_of_months = 3)
    require 'gruff'
    g = Gruff::Line.new #Define a New Graph
    g.title = "Recent posts and comments per month" #Title for the Graph
    current = Time.current
    posts_data = []
    comments_data = []
    labels_data = {}
    number_of_months.downto(0) do |t|
        month = current.months_ago(t)
        posts_data    << Post.in_one_month(month).count
        comments_data << Comment.in_one_month(month).count
        labels_data[(number_of_months - t)] = month.strftime('%B')
    end

    g.data("Posts", posts_data)
    g.data("Comments", comments_data)
    g.labels = labels_data
    return g.to_blob
  end

end

