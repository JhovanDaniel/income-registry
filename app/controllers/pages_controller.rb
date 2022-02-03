class PagesController < ApplicationController
    
    before_action :require_user, only: [:home, :about]
    
    def home
    end
    
    def about
    end
end
