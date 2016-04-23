defmodule PhoenixCommerce.LineItem do
  use PhoenixCommerce.Web, :model

  schema "line_items" do
    belongs_to :product, PhoenixCommerce.Product
    belongs_to :cart, PhoenixCommerce.Cart
    belongs_to :order, PhoenixCommerce.Order
    field :quantity, :integer

    timestamps
  end

  @required_fields ~w(product_id quantity)
  @optional_fields ~w(cart_id order_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
