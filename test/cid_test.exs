defmodule CidTest do
  use ExUnit.Case
  alias Cid
  @lengths [1, 4, 8, 16, 32, 64]

  setup do
    {:ok, lengths: @lengths}
  end

  describe "generate_id/2 using Cid alias" do
    test "generates an ID with the specified prefix using Cid alias" do
      assert String.starts_with?(Cid.generate_id("custom", 8), "custom_")
    end

    test "generates an ID with the default prefix using Cid alias" do
      assert String.starts_with?(Cid.generate_id(), "id_")
    end

    test "generates an ID with the correct length using Cid alias" do
      length = 8
      id = Cid.generate_id("test", length)
      random_part = String.split(id, "_") |> List.last()
      assert byte_size(random_part) == length * 2
    end
  end

  describe "generate_id/2 with varying lengths" do
    test "generates an ID of length", %{lengths: lengths} do
      for length <- lengths do
        id = Cid.generate_id("test", length)
        random_part = String.split(id, "_") |> List.last()
        assert byte_size(random_part) == length * 2
      end
    end
  end
end
