defmodule Cid do
  @moduledoc """
  Shortcut module for ContextID.
  """

  defdelegate generate_id(prefix \\ ContextID.default_prefix(), length \\ ContextID.default_length()), to: ContextID
end
