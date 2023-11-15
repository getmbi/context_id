defmodule ContextID do
  @moduledoc """
  A module for generating custom identifiers.
  """

  @doc """
  Generates a custom identifier with a specified `prefix` and of a specified `length`.
  """
  def generate_id(prefix \\ default_prefix(), length \\ default_length()) do
    validate_parameters(prefix, length)

    random_part = :crypto.strong_rand_bytes(length)
                  |> Base.encode16(case: :lower)

    "#{prefix}_#{random_part}"
  end

  @doc """
  Gets the default prefix for generated identifiers.

  The default prefix is used when no prefix is provided during ID generation.
  """
  def default_prefix do
    Application.get_env(:contextual_id, :default_prefix, "id")
  end

  @doc """
  Gets the default length for generated identifiers.

  The default length is used when no length is provided during ID generation.
  """
  def default_length do
    Application.get_env(:contextual_id, :default_length, 16)
  end

  defp validate_parameters(prefix, length) do
    validate_prefix(prefix)
    validate_length(length)
  end

  defp validate_prefix(prefix) when is_binary(prefix), do: :ok
  defp validate_prefix(_), do: raise(ArgumentError, "Prefix must be a string")

  defp validate_length(length) when is_integer(length) and length > 0, do: :ok
  defp validate_length(_), do: raise(ArgumentError, "Length must be a positive integer")
end
