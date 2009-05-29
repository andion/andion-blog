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

        Twitter::Search.new('bugyou').each do |t|
            twitts << t unless my_twitts.include? t
        end
        
        @twitts =  twitts [0..2]
        @my_twitts = my_twitts[0..2]
    end

end
