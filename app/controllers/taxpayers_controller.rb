class TaxpayersController < ApplicationController
    def show
        @taxpayer = Taxpayer.find(params[:id])
    end
    
    def index
        @taxpayers = Taxpayer.all
    end
end