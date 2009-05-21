class LifeController < ApplicationController

    require 'rubygems'
    require 'twitter'
    
    layout 'life'

    def show
        twitts = []
        my_twitts = []
        
        Twitter::Search.new('bugyou').each do |r| 
            twitts << r
        end
        
        Twitter::Search.new.from('bugyou').each do |r| 
            my_twitts << r
        end
        @twitts = (twitts - my_twitts)[0..2]
        @my_twitts = my_twitts[0..2]
    end

end
