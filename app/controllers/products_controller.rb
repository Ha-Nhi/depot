class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
        define_st
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
    def define_st
      @isLoang = Array.new(8) { Array.new(8,false) }
      @canBeCansu = Array.new(8) { Array.new(8,true) }
      @a=[[1,1,1,1,1,1,1,1],
        [1,0,1, 0, 1, 1, 0, 1],[1,1, 0, 3, 1, 1, 1, 1],[1, 0, 2, 0, 2, 1, 0, 1],[1,0, 0, 1, 0, 1, 0, 1],[1,0, 1, 0, 1, 0, 2,1],[1,1, 0, 1, 0, 2, 0,1],[1,1,1,1,1,1,1,1]]
      for i in 1..6
          for j in 1..6
            if(@a[i-1][j] == 0 or @a[i+1][j] == 0 or @a[i][j-1] == 0 or @a[i][j+1]==0)
              @canBeCansu[i][j] = false
            end
             p 
          end
      end
      p @canBeCansu[1][1]
      # p @canBeCansu[2]
      # p @canBeCansu[3]
      # p @canBeCansu[4]
      # p @canBeCansu[5]
      # p @canBeCansu[6]
      loang(1,1, @canBeCansu[1][1])
      loang(1,1, false)
    end

    def loang(i, j, canBeCansu)

       kt = true
        for m in 1..6
          p @a[m]
          for n in 1..6
            
            if(@a[m][n] != 0)
              kt = false
            end
          end
        end
        p 'xx'
        if kt 
          puts 'xxxxxxxxxxxxxxxxx' 
          return
        end

      @isLoang[i][j] = true;
      
      if canBeCansu
        @a[i-1][ j] = @a[i-1][ j] - 1;
        @a[i+1][ j] = @a[i+1][ j] - 1;
        @a[i][j+1] = @a[i][ j+1] - 1;
        @a[i][j-1] = @a[i][ j-1] - 1;
      end
     
      Loang(i+1, j+1, canBeCansu[i+1][j+1])


      if canBeCansu
        @a[i-1][ j] = @a[i-1][ j] + 1;
        @a[i+1][ j] = @a[i+1][ j] + 1;
        @a[i][ j+1] = @a[i][ j+1] + 1;
        @a[i][ j-1] = @a[i][ j-1] + 1;
      end
    @isLoang[m][n] = false;
    end
end
