class Sponsor::CompaniesController < ApplicationController
  # GET /sponsor/companies
  # GET /sponsor/companies.json
  def index
    @sponsor_companies = Sponsor::Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsor_companies }
    end
  end

  # GET /sponsor/companies/1
  # GET /sponsor/companies/1.json
  def show
    @sponsor_company = Sponsor::Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsor_company }
    end
  end

  # GET /sponsor/companies/new
  # GET /sponsor/companies/new.json
  def new
    @sponsor_company = Sponsor::Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsor_company }
    end
  end

  # GET /sponsor/companies/1/edit
  def edit
    @sponsor_company = Sponsor::Company.find(params[:id])
  end

  # POST /sponsor/companies
  # POST /sponsor/companies.json
  def create
    @sponsor_company = Sponsor::Company.new(params[:sponsor_company])

    respond_to do |format|
      if @sponsor_company.save
        format.html { redirect_to @sponsor_company, notice: 'Company was successfully created.' }
        format.json { render json: @sponsor_company, status: :created, location: @sponsor_company }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsor_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sponsor/companies/1
  # PUT /sponsor/companies/1.json
  def update
    @sponsor_company = Sponsor::Company.find(params[:id])

    respond_to do |format|
      if @sponsor_company.update_attributes(params[:sponsor_company])
        format.html { redirect_to @sponsor_company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsor_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsor/companies/1
  # DELETE /sponsor/companies/1.json
  def destroy
    @sponsor_company = Sponsor::Company.find(params[:id])
    @sponsor_company.destroy

    respond_to do |format|
      format.html { redirect_to sponsor_companies_url }
      format.json { head :no_content }
    end
  end
end
