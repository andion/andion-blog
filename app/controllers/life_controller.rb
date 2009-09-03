class LifeController < ApplicationController

  require 'rubygems'
  require 'twitter'

  layout 'life'

  def show
    twitts = []
    my_twitts = []
    
    begin

      Twitter::Search.new.from('bugyou').each do |t|
        my_twitts << t
      end

      Twitter::Search.new('@bugyou').each do |t|
        twitts << t unless my_twitts.include? t || t.from_user == 'ooemiso'
      end

      @twitts =  twitts[0..2]
      @my_twitts = my_twitts[0..2]
    rescue
      @no_tweets = true
      p $!  
      puts $@
    end
  end

  #
  # Returns a graph showing monthly comment & post count
  # It uses +send_data+
  #
  def posts_and_comments_graph
    number_of_months = params[:number_of_months] ? params[:number_of_months] : 3
    send_data(Post.posts_and_comments_per_month_graph(number_of_months.to_i), :disposition => 'inline', :type => 'image/png')
  end

end

