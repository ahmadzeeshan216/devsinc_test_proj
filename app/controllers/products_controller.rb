class ProductsController < ApplicationController
    before_action :authenticate_user!, except:[:show]

    def index
        @products=Product.where(user_id: current_user.id)
    end
    
    def new
        @product=current_user.products.build
    end
    
    def show
        @product=Product.find(params[:id])
    end
    
    def create
        @product=current_user.products.build(productParams)

        if(@product.save)
            redirect_to @product
        else
            render 'new'
        end
    end

    def edit
        @product=Product.find(params[:id])
    end

    def update
        
        @product=Product.find(params[:id])

        if(@product.update(productUpdateParams))
            redirect_to @product
        else
            render 'edit'
        end

    end

    private def productParams
        params.require(:product).permit(:name,:description,:user_id,:quantity,:price,:images => [])
    end

    private def productUpdateParams
        params.require(:product).permit(:name,:description,:user_id,:quantity,:price)
    end
end
