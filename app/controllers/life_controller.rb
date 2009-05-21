class LifeController < ApplicationController

    require 'rubygems'
    require 'twitter'
    
    layout 'life'

    def show
        @twitts = []
        @my_twitts = []
        
        Twitter::Search.new('bugyou').per_page(3).each do |r| 
            @twitts << r
        end
        
        Twitter::Search.new.from('bugyou').per_page(3).each do |r| 
            @my_twitts << r
        end
    end

end
