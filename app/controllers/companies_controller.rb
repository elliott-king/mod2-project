class CompaniesController < ApplicationController

    def index
        @companies = Company.all
    end

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new 
    end

    def create
        company = Company.new(company_params)
        if company.save
            redirect_to company_path(company)
        else
            flash[:errors] = company.errors.full_messages
            redirect_to new_company_path
        end
    end

    def edit
        @company = Company.find(params[:id])
    end

    def update
        company = Company.find(params[:id])
        if company.update(company_params)
            redirect_to company_path(company)
        else
            flash[:errors] = company.errors.full_messages
            redirect_to edit_company_path(company)
        end
    end

    private
    def company_params 
        params.require(:company).permit!
    end
end
