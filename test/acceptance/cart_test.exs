defmodule PhoenixCommerce.Acceptance.CartTest do
  use ExUnit.Case
  use Hound.Helpers
  hound_session
  alias PhoenixCommerce.Product
  alias PhoenixCommerce.LineItem
  alias PhoenixCommerce.Repo

  @moduletag :cart_tests

  @upload %Plug.Upload{path: Path.relative_to_cwd("test/files/broom.jpg"), filename: "broom.jpg", content_type: "image/jpg"}

  def get_url(path) do
      host=Application.get_env(:phoenix_commerce, PhoenixCommerce.Endpoint)[:url][:host]
      port=Application.get_env(:phoenix_commerce, PhoenixCommerce.Endpoint)[:http][:port]
      "http://#{host}:#{port}/#{path}"
  end

  setup do
    Repo.delete_all(LineItem)
    Repo.delete_all(Product)
    {:ok, product} =
      Product.changeset(%Product{}, %{
        name: "Some product",
        description: "Some product description",
        price: Decimal.new("25.20"),
        image: @upload
      }) |> Repo.insert
    {:ok, product: product}
  end

  test "/cart shows empty cart" do
    navigate_to get_url "/cart"
    assert visible_text(heading) == "Your cart"
    assert length(line_items) == 0
  end

  test "adding product to cart shows product in cart", %{product: product} do
    navigate_to get_url "/products/#{product.id}"
    click(add_to_cart_button)
    assert length(line_items) == 1
    assert visible_text(hd(line_items)) =~ ~r/#{product.name}/
  end

  test "different sessions have different carts", %{product: product} do
    navigate_to get_url "/products/#{product.id}"
    click(add_to_cart_button)
    assert length(line_items) == 1
    change_session_to("second user")
    navigate_to get_url "/cart"
    assert length(line_items) == 0
  end

  test "removing an item from the cart", %{product: product} do
    navigate_to get_url "/products/#{product.id}"
    click(add_to_cart_button)
    assert length(line_items) == 1
    click(remove_from_cart_button(product))
    assert length(line_items) == 0
  end

  test "updating a line item's quantity", %{product: product} do
    navigate_to get_url "/products/#{product.id}"
    click(add_to_cart_button)
    update_quantity(product, 5)
    assert quantity(product) == 5
  end

  def heading, do: find_element(:css, "h2")
  def cart, do: find_element(:css, ".cart")
  def cart_table, do: find_within_element(cart, :css, "table")
  def cart_tbody, do: find_within_element(cart_table, :css, "tbody")
  def line_items, do: find_all_within_element(cart_tbody, :css, "tr")
  def add_to_cart_button do
    find_element(:css, "input[type=submit].add-to-cart")
  end
  def remove_from_cart_button(product) do
    product_row(product)
    |> find_within_element(:css, ".remove-from-cart")
  end
  def product_row(product) do
    find_element(:css, "tr.product-#{product.id}")
  end
  def quantity_field(product) do
    product_row(product)
    |> find_within_element(:css, ".quantity")
  end
  def update_quantity(product, qty) do
    quantity_field(product)
    |> fill_field(qty)

    quantity_field(product)
    |> submit_element
  end
  def quantity(product) do
    {qty, _} =
      quantity_field(product)
      |> attribute_value(:value)
      |> Integer.parse

    qty
  end
end
