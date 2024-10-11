defmodule Backpex.Adapters.Postgres do
  @behaviour Backpex.Adapter

  import Ecto.Query

  def sort_direction(:asc), do: :asc_nulls_first
  def sort_direction(:desc), do: :desc_nulls_first

  def search_condition(schema_name, field_name, search_string) do
    dynamic(
      [{^schema_name, schema_name}],
      ilike(schema_name |> field(^field_name), ^search_string)
    )
  end
end
