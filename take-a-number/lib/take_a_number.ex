defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(state \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state) |> loop()

      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1) |> loop()

      :stop ->
        exit(1)

      _ ->
        loop(state)
    end
  end
end
