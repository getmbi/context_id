defmodule ContextIDTest do
  use ExUnit.Case
  alias ContextID
  @lengths [1, 4, 8, 16, 32, 64]

  setup do
    {:ok, lengths: @lengths}
  end

  describe "generate_id/2" do
    test "generates an ID with the specified prefix" do
      assert String.starts_with?(ContextID.generate_id("custom", 8), "custom_")
    end

    test "generates an ID with the default prefix when none is provided" do
      assert String.starts_with?(ContextID.generate_id(), "id_")
    end

    test "generates an ID with the correct length" do
      length = 8
      id = ContextID.generate_id("test", length)
      random_part = String.split(id, "_") |> List.last()
      assert byte_size(random_part) == length * 2
    end

    test "raises ArgumentError for non-string prefix" do
      assert_raise ArgumentError, "Prefix must be a string", fn ->
        ContextID.generate_id(123, 8)
      end
    end

    test "raises ArgumentError for invalid length" do
      assert_raise ArgumentError, "Length must be a positive integer", fn ->
        ContextID.generate_id("test", -5)
      end
    end
  end

  describe "generate_id/2 with varying lengths" do
    test "generates an ID of length", %{lengths: lengths} do
      for length <- lengths do
        id = ContextID.generate_id("test", length)
        random_part = String.split(id, "_") |> List.last()
        assert byte_size(random_part) == length * 2
      end
    end
  end
end
