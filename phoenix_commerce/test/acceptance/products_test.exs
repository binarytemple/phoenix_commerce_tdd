defmodule PhoenixCommerce.Acceptance.ProductsTest do 

  use Hound.Helpers
  use ExUnit.Case
  hound_session
  
  alias PhoenixCommerce.Product
  alias PhoenixCommerce.Repo

    test "/products has a list of products" do 

      host=Application.get_env(:phoenix_commerce, PhoenixCommerce.Endpoint)[:url][:host]
      port=Application.get_env(:phoenix_commerce, PhoenixCommerce.Endpoint)[:http][:port]

      navigate_to "http://#{host}:#{port}/products"
      ul_products = find_element(:css,"ul.products")
      IO.puts "#{ul_products}"
      assert ul_products
    end 

    #test "/products - product details include name, description and price" do 
    #      {:ok, product} = 
    #      %Product{ 
    #      name: "Some product",
    #      description: "Some product description",
    #      price: Decimal.new("25.50")
    #      } |> Repo.insert

    #  navigate_to "/products"

    #  product_li = find_element(:css,"ul.products")
    #  IO.inspect product_li
    #  name = find_within_element(product_li, :css, "h3")
    #  price = find_within_element(product_li, :css, "h4")
    #  description = find_within_element(product_li, :css, "p")

    #  IO.puts "name:#{name} - price: #{price} - description: #{description}"

    #  #assert visible_text(name) == product.name 
    #  #assert visible_text(price) == product.price
    #  #assert visible_text(description) == product.description
    #  assert 1 == 1

    #end 

end

