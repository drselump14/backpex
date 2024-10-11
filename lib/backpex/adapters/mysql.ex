defmodule Backpex.Adapters.MySQL do
  @behaviour Backpex.Adapter

  import Ecto.Query

  def sort_direction(:asc), do: :asc
  def sort_direction(:desc), do: :desc

  def search_condition(schema_name, field_name, search_string) do
    dynamic(
      [{^schema_name, schema_name}],
      like(schema_name |> field(^field_name), ^search_string)
    )
  end
end
