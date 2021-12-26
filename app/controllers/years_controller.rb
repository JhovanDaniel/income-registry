class YearsController < ApplicationController
    
    before_action :set_year, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
     private
    
    def set_year
        @year = Year.find(params[:id])
    end
    
    def taxpayer_params
        params.require(:taxpayer).permit(:name)
    end
    
end