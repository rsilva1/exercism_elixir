defmodule NameBadge do
  @owner_department "owner"
  @separator " - "

  def print(id, name, department) do
    [
      format_badge(id),
      name,
      format_department(department)
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(@separator)
  end

  defp format_badge(id), do: (if id, do: "[#{id}]", else: nil)

  defp format_department(department), do: String.upcase(department || @owner_department)
end
