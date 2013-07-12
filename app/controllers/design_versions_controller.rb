class DesignVersionsController < ApplicationController
  # GET /design_versions
  # GET /design_versions.json
  def index
    @design_versions = DesignVersion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @design_versions }
    end
  end

  # GET /design_versions/1
  # GET /design_versions/1.json
  def show
    @design_version = DesignVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @design_version }
    end
  end

  # GET /design_versions/new
  # GET /design_versions/new.json
  def new
    @design_version = DesignVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @design_version }
    end
  end

  # GET /design_versions/1/edit
  def edit
    @design_version = DesignVersion.find(params[:id])
  end

  # POST /design_versions
  # POST /design_versions.json
  def create
    @design_version = DesignVersion.new(params[:design_version])

    respond_to do |format|
      if @design_version.save
        format.html { redirect_to @design_version, notice: 'Design version was successfully created.' }
        format.json { render json: @design_version, status: :created, location: @design_version }
      else
        format.html { render action: "new" }
        format.json { render json: @design_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /design_versions/1
  # PUT /design_versions/1.json
  def update
    @design_version = DesignVersion.find(params[:id])

    respond_to do |format|
      if @design_version.update_attributes(params[:design_version])
        format.html { redirect_to @design_version, notice: 'Design version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @design_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /design_versions/1
  # DELETE /design_versions/1.json
  def destroy
    @design_version = DesignVersion.find(params[:id])
    @design_version.destroy

    respond_to do |format|
      format.html { redirect_to design_versions_url }
      format.json { head :no_content }
    end
  end
end
