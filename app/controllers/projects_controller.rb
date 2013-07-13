class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  before_filter :authenticate_user!
  def index
    @projects = Project.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @palettes = Palette.where("project_id=?", @project.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @palette = @project.palettes.build
    @al = @palette.attribute_layers.build
    @attribute = @al.attributes.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user = current_user
      if @project.save
        redirect_to project_path(@project)
      else
        render action: "new"
      end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
  def send_invitation
    @project = Project.find(params[:id])
    ProjectMailer.send_invitation_for_project(@project, params[:email])
    render nothing: true
  end


  def design
    project = Project.find(params[:id])
    design_versions = DesignVersion.where("project_id=?", project.id)
    most_rec_des_ver = design_versions.last
    # render text: most_rec_des_ver.design_html
    render 'design'
  end
  
  def product_by_category
    @projects = Project.where(product_category_id: params[:product_catgory_id], show_in_catalog: true)
  end
  
  def product_by_artisan
    @projects = Project.where(artisan_id: params[:product_catgory_id], show_in_catalog: true)
  end

end
