class LifeController < ApplicationController

  require 'rubygems'
  require 'twitter'
    
  layout 'life'

  def show
    twitts = []
    my_twitts = []

    Twitter::Search.new.from('bugyou').each do |t|
      my_twitts << t
    end

<<<<<<< HEAD:app/controllers/life_controller.rb
        Twitter::Search.new('bugyou').each do |t|
            twitts << t unless my_twitts.include? t || t.from_user == 'ooemiso'
        end
        
        @twitts =  twitts [0..2]
        @my_twitts = my_twitts[0..2]
=======
    Twitter::Search.new('bugyou').each do |t|
      twitts << t unless my_twitts.include? t
>>>>>>> 10d9b61e816253fc332cd763a996363dee0bb1ef:app/controllers/life_controller.rb
    end
        
    @twitts =  twitts [0..2]
    @my_twitts = my_twitts[0..2]
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
