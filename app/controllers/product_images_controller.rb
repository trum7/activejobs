class ProductImagesController < ApplicationController
  before_action :set_images, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
   # GET /images
   # GET /images.json
  def index
   @images = ProductImage.all
  end

   # GET /images/1
   # GET /images/1.json
   def show
   end

   # GET /images/new
   def new
     @image = ProductImage.new
   end

   # GET /images/1/edit
   def edit
   end

   # POST /images
   # POST /images.json
   def create
    @image = ProductImage.new(image: params[:file])
    @image.sort_order = session[:order]
    session[:order] += 1
    @image.product_id = session[:productid]
    @image.save
    #respond_to do |format|
      #if @image.save
        #format.html { redirect_to @image, notice: 'Image was successfully created.' }
        #format.js { render :listproduct, status: :created, location: @image }
        #redirect_to list_product_index_path
      #else
        #format.html { render :new }
        #format.json { render json: @image.errors, status: :unprocessable_entity }
      #end
    #end
   end
   def createExisting
     new_order = 0
     if ProductImage.where(:product_id => params[:product_id] ).exists?
      order =  ProductImage.where(:product_id => params[:product_id] ).order("sort_order DESC")
      new_order = (order[0].sort_order.to_i)+1
     else
      new_order = 1
     end
     @image_new = ProductImage.new(image: params[:file])
     @image_new.sort_order = (new_order.to_s)
    #  session[:order] += 1
     @image_new.product_id = params[:product_id]
     @image_new.save
   end
   # PATCH/PUT /images/1
   # PATCH/PUT /images/1.json
   def updateorder
     arreglo = params['info']
     puts arreglo.size.to_s
     @update_images = ProductImage.where(:product_id => params['proID'] )
     @update_images.each do |u|
       for i in (0..arreglo.size-1)
         if u.sort_order.to_s == arreglo[i].to_s
           t_order = (i+1).to_s
           u.sort_order = t_order
           u.save!
          break
         end
      end
      @update_images = ProductImage.where(:product_id => params['proID'] ).order("sort_order")
    end
    #  respond_to do |format|
    #    if @image.update(image_params)
    #      format.html { redirect_to @image, notice: 'Image was successfully updated.' }
    #      format.json { render :show, status: :ok, location: @image }
    #    else
    #      format.html { render :edit }
    #      format.json { render json: @image.errors, status: :unprocessable_entity }
    #    end
    #  end
   end

   # DELETE /images/1
   # DELETE /images/1.json
   def destroy
     @images.destroy
     render nothing: true
   end

   private
     # Use callbacks to share common setup or constraints between actions.
    def set_images
     @images = ProductImage.find(params[:id])
    end

     # Never trust parameters from the scary internet, only allow the white list through.
    def images_params
      params.require(:images).permit(:product_image_id, :image, :sort_order)
    end

end
