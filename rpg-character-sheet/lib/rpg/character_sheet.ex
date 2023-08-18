defmodule RPG.CharacterSheet do
  @welcome "Welcome! Let's fill out your character sheet together.\n"
  @prompt_name "What is your character's name?\n"
  @prompt_class "What is your character's class?\n"
  @prompt_level "What is your character's level?\n"
  @character_presentation_label "Your character"

  @spec welcome :: :ok
  def welcome(), do: IO.write(@welcome)

  @spec ask_name :: binary
  def ask_name(), do: IO.gets(@prompt_name) |> String.trim()

  @spec ask_class :: binary
  def ask_class(), do: IO.gets(@prompt_class) |> String.trim()

  @spec ask_level :: integer
  def ask_level(), do: IO.gets(@prompt_level) |> String.trim() |> String.to_integer()

  @spec run :: :ok
  def run() do
    welcome()
    character = %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level(),
    }
    IO.inspect(character, label: @character_presentation_label)
  end
end
