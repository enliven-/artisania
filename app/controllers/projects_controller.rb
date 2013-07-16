class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  before_filter :authenticate_user!
  def index
    @projects = Project.where("user_id =?", current_user.id)
    
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
      render action: :edit, id: @project.id
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
    if current_user.customer?
      ProjectMailer.send_invitation_for_project(@project, @project.user.email).deliver
    else
      ProjectMailer.send_invitation_for_project(@project, User.find(@project.customer_id).email).deliver if @project.customer_id
    end
    render nothing: true
  end


  def design
    project = Project.find(params[:id])
    design_versions = DesignVersion.where("project_id=?", project.id)
    most_rec_des_ver = design_versions.last
    # render text: most_rec_des_ver.design_html
    session[:project_id] = project.id
    render 'design'
  end
  
  def products_by_category
    @projects = Project.where(product_category_id: params[:product_catgory_id], show_in_catalog: true)
  end
  
  def products_by_artisan
    @projects = Project.where(user_id: params[:user_id], show_in_catalog: true)
    render 'products'
  end
  
  def duplicate
    project = Project.find(params[:id])
    new_project = project
    # new_project = Project.new(project)
    new_project.update_attribute :customer_id, current_user.id
    new_project.save

    redirect_to action: :design, id: new_project.id
  end
  
  def products
    @projects = Project.where(show_in_catalog: true)
  end
  
  def customer_projects
    @projects = Project.where(customer_id: params[:customer_id])
  end

  def show_product_in_catalog
    project = Project.find(params[:id])
    project.show_in_catalog = false
    project.save
    redirect_to action: :products_by_artisan, user_id: current_user.id
  end

end
