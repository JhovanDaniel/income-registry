class TaxpayersController < ApplicationController
    
    before_action :set_taxpayer, only: [:show, :edit, :update, :destroy]
    
    def show
    end
    
    def index
        @taxpayers = Taxpayer.all
    end
    
    def new
        @taxpayer = Taxpayer.new
    end
    
    def create
        @taxpayer = Taxpayer.new(taxpayer_params)
        if @taxpayer.save
            redirect_to taxpayer_path(@taxpayer)
            flash[:notice] = "Article was created successfully"
        else 
            render 'new'
        end
    end
    
    def edit 
    end
    
    def update
        if @taxpayer.update(taxpayer_params)
            flash[:notice] = "Taxpayer was updated successfully"
            redirect_to @taxpayer
        else
            render 'edit'
        end
    end
    
    def destroy 
        @taxpayer.destroy
        redirect_to taxpayers_path
    end
    
    private
    
    def set_taxpayer
        @taxpayer = Taxpayer.find(params[:id])
    end
    
    def taxpayer_params
        params.require(:taxpayer).permit(:ird_no, :old_ird_no, :first_name, :middle_name, :last_name, :address, :entity_type)
    end
    
    
end