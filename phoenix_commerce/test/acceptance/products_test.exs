defmodule PhoenixCommerce.Acceptance.ProductsTest do 

  use Hound.Helpers
  use ExUnit.Case
  hound_session

    test "/products has a list of products" do 
    navigate_to "/products"
    


    assert find_element(:css,"ul.products")
    end 



end

