class TaxpayersController < ApplicationController
    
    before_action :set_taxpayer, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:show, :edit, :update, :destroy, :new, :create, :index]
    before_action :require_registrar_admin, only: [:edit, :update, :new, :create, :destroy]
    
    
    
    
    def show
    end
    
    def index
        @q = Taxpayer.ransack(params[:q])
        @taxpayers = @q.result(distinct: true)
        @results = @q.result.paginate(page: params[:page], per_page: 15)
        #@taxpayers = Taxpayer.paginate(page: params[:page], per_page: 15)
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
        params.require(:taxpayer).permit(:ird_no, :old_ird_no, :first_name, :middle_name, :last_name, :address, :entity_type, :activity_status)
    end
    
    def redirect_to_index
        redirect_to taxpayers_path
    end
    
    helper_method :redirect_to_index
    
    def collect_results
        @q = Taxpayer.ransack(params[:q])
        @taxpayers = @q.result(distinct: true)
        @results = @q.result.paginate(page: params[:page], per_page: 15)
    end
    
    helper_method :collect_results
    
end