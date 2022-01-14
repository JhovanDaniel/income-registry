class CompaniesController < ApplicationController
    
    before_action :set_company, only: [:show, :edit, :update, :destroy, :company_taxpayers]
    before_action :require_user, only: [:show, :edit, :update, :destroy, :new, :create, :index]
    before_action :require_registrar_admin, only: [:edit, :update, :new, :create, :destroy]
    
    def index
        @q = Company.ransack(params[:q])
        @companies = @q.result(distinct: true)
        @results = @q.result.paginate(page: params[:page], per_page: 15)
        #@taxpayers = Taxpayer.paginate(page: params[:page], per_page: 15)
    end
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to company_path(@company)
            flash[:notice] = "Company was created successfully"
        else 
            render 'new'
        end
    end
    
    def edit 
    end
    
    def update
        if @company.update(company_params)
            flash[:notice] = "Company was updated successfully"
            redirect_to @company
        else
            render 'edit'
        end
    end
    
    def show
    end
    
    def destroy 
        @company.destroy
        redirect_to companies_path
    end
    
    def company_taxpayers
        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "file_name", template: "companies/company_taxpayers.html.erb", layout: 'pdf.html',  page_height: '1in', page_width: '2.62in', margin: {top: 5, bottom: 5, left: 2, right: 2}
            end
        end
    end
    
     private
    
    def set_company
        @company = Company.find(params[:id])
    end
    
    def company_params
        params.require(:company).permit(:ird_no, :name, :address, :entity_type, :activity_status, :paye_no)
    end
    
end