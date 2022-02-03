class CompaniesController < ApplicationController
    
    before_action :set_company, only: [:show, :edit, :update, :destroy, :company_taxpayers]
    before_action :require_user, only: [:show, :edit, :update, :destroy, :new, :create, :index]
    before_action :require_registrar_admin, only: [:edit, :update, :new, :create, :destroy]
    
    def index
        @q = Company.ransack(params[:q])
        @results = @q.result(distinct: true)
        @companies = @results.paginate(page: params[:page], per_page: 15)
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
                render pdf: "file_name", template: "companies/company_taxpayers.html.erb", layout: 'pdf.html',  page_size: 'A4', margin: {top: 0, bottom: 0, left: 5, right: 5}
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