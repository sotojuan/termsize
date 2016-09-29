defmodule TermSizeTest do
  use ExUnit.Case

  test "gets size" do
    {cols, rows} = TermSize.get

    assert cols > 0
    assert rows > 0
  end
end
