class HomeController < ApplicationController
    
    def index
        @tests = Tda.all()      
        #@date = Date.today.to_s 
        @date1 = Date.today.strftime('%d-%m-%Y ')
    end
end