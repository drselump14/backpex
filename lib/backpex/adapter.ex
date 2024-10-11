defmodule Backpex.Adapter do
  @callback sort_direction(:asc | :desc) :: atom()
end
