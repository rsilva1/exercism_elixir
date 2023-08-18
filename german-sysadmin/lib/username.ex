defmodule Username do
  @spec sanitize(charlist()) :: charlist()
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    username
    |> Enum.map(&map_char/1)
    |> Enum.concat()
  end

  defp map_char(char) do
    case char do
      char when ?a <= char and char <= ?z -> [char]
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      ?_ -> ~c"_"
      _ -> ~c""
    end
  end
end
