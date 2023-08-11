defmodule LanguageList do
  @elixir_lang "Elixir"

  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    List.delete_at(list, 0)
  end

  def first(list) do
    List.first(list)
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    @elixir_lang in list
  end
end
