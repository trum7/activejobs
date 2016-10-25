class CategoryController < ApplicationController
  respond_to :html, :js
  def add
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      render layout: "admin"
    end
  end

  def new
    name = params['name']


    temp = Category.new
    temp.name = name


    temp.save!

    redirect_to list_category_index_path

  end
  def show
    @count_products = CategoryHasProduct.all
    @show_category = Category.select("DISTINCT category_id as id,categories.name as name,categories.status as status, categories.created_at as created_at" ).joins("INNER JOIN category_has_products ON category_has_products.category_id = categories.id  LEFT JOIN products on category_has_products.product_id = products.id WHERE products.status = '1'").order("categories.name ASC")
    @show_category = Category.select("DISTINCT category_id as id,categories.name as name,categories.status as status,categories.created_at as created_at" ).joins("INNER JOIN category_has_products ON category_has_products.category_id = categories.id  LEFT JOIN products on category_has_products.product_id = products.id WHERE products.status = '1'").order("categories.name ASC")
    @show_category = @show_category.paginate(:page => params[:page],:per_page => 8)
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
    #render layout: "application"
  end

  def list
    @list =Category.all.order("id ASC").paginate(:page => params[:page],:per_page => 8)
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      render layout: "admin"
    end
  end

  def edit
    @cate = Category.find( params[:id] )
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      render layout: "admin"
    end
  end

  def change
    if request.xhr?
      @cate = Category.find( params[:id] )
      @cate.name = params[:name]
      @cate.save!
      redirect_to list_category_index_path
    end

  end

  def status
    @cate = Category.find( params[:id] )
    if @cate.status == 1
      @cate.status = 0
    else
      @cate.status = 1
    end
    @cate.save!
    redirect_to list_category_index_path
  end

  helper_method :category_stock
  def category_stock(cat_id)
    total = 0
    quant =Category.select("DISTINCT products.id as id, products.quantity as quantity" ).joins("INNER JOIN category_has_products ON category_has_products.category_id = categories.id  LEFT JOIN products on category_has_products.product_id = products.id WHERE products.status = '1' and category_id = "+cat_id.to_s)
    quant.each do |p|
      total+= p.quantity.to_i
    end

    return total
  end

  helper_method :find_image
  def find_image(cat_id)
      cat_image = ProductImage.select("DISTINCT product_images.image as image ").joins("INNER JOIN category_has_products ON category_has_products.product_id = product_images.product_id WHERE  category_id = "+ cat_id.to_s).take
    return cat_image
  end

  helper_method :find_discount
  def find_discount(cat_id)
    disc = false
    cate_dis = Product.joins("INNER JOIN category_has_products ON category_has_products.product_id = products.id WHERE  status = '1' and discount != 0.0 and category_id ="+ cat_id.to_s)
    if  cate_dis.size  != 0.0
      disc=true
    end
    return disc
  end

end
