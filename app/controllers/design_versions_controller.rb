class DesignVersionsController < ApplicationController

  # GET /design_versions
  # GET /design_versions.json
  # def index
  #   @design_versions = DesignVersion.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @design_versions }
  #   end
  # end

  def index
    if params[:counter]
      @design_version = get_design_version(params[:counter])
    elsif params[:prev]
      @design_version = get_prev_version
    elsif params[:next]
      @design_version = get_prev_version
    else
      @design_version = get_latest_version
    end

    render text: @design_version.design_html
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
  # def create
  #   @design_version = DesignVersion.new(params[:design_version])

  #   respond_to do |format|
  #     if @design_version.save
  #       format.html { redirect_to @design_version, notice: 'Design version was successfully created.' }
  #       format.json { render json: @design_version, status: :created, location: @design_version }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @design_version.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    puts "----------------------------------------"
    p params[:design_html]
    puts "----------------------------------------"

    @design_version = DesignVersion.new(:design_html => params[:design_html])
    @design_version.project_id = session[:project_id]
    if @design_version.save
      # session[:counter] = Project.find(session[:project_id]).design_versions.all.size + 1
      design_versions = DesignVersion.where("project_id=?", @design_version.project_id)
      session[:counter] = design_versions.all.size + 1
      render text: @design_version.design_html
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


  def get_prev_version
    project_id      = session[:project_id]
    current_counter = session[:counter]
    design_versions = Project.find(project_id).design_versions
    if current_counter > 0
      current_counter -= 1
    end
    
    session[:counter] = current_counter
    puts current_counter
    @design_version = design_versions[current_counter-1]
  end


  def get_next_version
    project_id      = session[:project_id]
    current_counter = session[:counter]
    design_versions = Project.find(project_id).design_versions

    if current_counter < design_versions.size-1
      current_counter += 1
    end
    
    session[:counter] = current_counter
    @design_version = design_versions[current_counter]
  end

  def get_latest_version
    project_id      = session[:project_id]
    design_versions = Project.find(project_id).design_versions
    session[:counter] = design_versions.size
    @design_version = design_versions.last
  end

  def get_design_version counter
    project_id      = session[:project_id]
    design_versions = Project.find(project_id).design_versions
    @design_version = design_versions[counter]
  end

end
