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
            flash[:notice] = "Taxpayer was created successfully"
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
    
    def active
        @r = Taxpayer.ransack(params[:q])
        @taxpayers = @r.result(distinct: true)
        @results = @r.result.paginate(page: params[:page], per_page: 15)
    end
    
    def inactive
        @p = Taxpayer.ransack(params[:q])
        @taxpayers = @p.result(distinct: true)
        @results = @p.result.paginate(page: params[:page], per_page: 15)
    end
    
    def year_index
        @x = Taxpayer.ransack(params[:q])
        @taxpayers = @x.result(distinct: true)
        @results = @x.result.paginate(page: params[:page], per_page: 15)
    end
    
    private
    
    def set_taxpayer
        @taxpayer = Taxpayer.find(params[:id])
    end
    
    def taxpayer_params
        params.require(:taxpayer).permit(:ird_no, :old_ird_no, :first_name, :middle_name, :last_name, :address, :entity_type, :activity_status, :company_id, year_ids: [])
    end
    
    def redirect_to_index
        redirect_to taxpayers_path
    end
    
    helper_method :redirect_to_index
    
end