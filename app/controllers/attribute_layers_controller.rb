class AttributeLayersController < ApplicationController
  # GET /attribute_layers
  # GET /attribute_layers.json
  def index
    @attribute_layers = AttributeLayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attribute_layers }
    end
  end

  # GET /attribute_layers/1
  # GET /attribute_layers/1.json
  def show
    @attribute_layer = AttributeLayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attribute_layer }
    end
  end

  # GET /attribute_layers/new
  # GET /attribute_layers/new.json
  def new
    @attribute_layer = AttributeLayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attribute_layer }
    end
  end

  # GET /attribute_layers/1/edit
  def edit
    @attribute_layer = AttributeLayer.find(params[:id])
  end

  # POST /attribute_layers
  # POST /attribute_layers.json
  def create
    @attribute_layer = AttributeLayer.new(params[:attribute_layer])

    respond_to do |format|
      if @attribute_layer.save
        format.html { redirect_to @attribute_layer, notice: 'Attribute layer was successfully created.' }
        format.json { render json: @attribute_layer, status: :created, location: @attribute_layer }
      else
        format.html { render action: "new" }
        format.json { render json: @attribute_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attribute_layers/1
  # PUT /attribute_layers/1.json
  def update
    @attribute_layer = AttributeLayer.find(params[:id])

    respond_to do |format|
      if @attribute_layer.update_attributes(params[:attribute_layer])
        format.html { redirect_to @attribute_layer, notice: 'Attribute layer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attribute_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribute_layers/1
  # DELETE /attribute_layers/1.json
  def destroy
    @attribute_layer = AttributeLayer.find(params[:id])
    @attribute_layer.destroy

    respond_to do |format|
      format.html { redirect_to attribute_layers_url }
      format.json { head :no_content }
    end
  end
end
