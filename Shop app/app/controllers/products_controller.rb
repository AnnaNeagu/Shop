class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        @products = Product.all
    end
end


# URL in browser  -> router
# analize URL -> send matching action in matching controller
# controller will try to match with the view