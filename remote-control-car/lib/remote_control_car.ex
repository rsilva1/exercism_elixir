defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0,
  ]
  def new(nickname \\ "none")

  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%{distance_driven_in_meters: meters} = %RemoteControlCar{}), do: "#{meters} meters"

  def display_battery(%{battery_percentage: percentage} = %RemoteControlCar{}) when percentage == 0, do: "Battery empty"
  def display_battery(%{battery_percentage: percentage} = %RemoteControlCar{}), do: "Battery at #{percentage}%"

  def drive(remote_car = %RemoteControlCar{}) when remote_car.battery_percentage == 0, do: remote_car
  def drive(remote_car = %RemoteControlCar{}) do
    %{
      remote_car
      | distance_driven_in_meters: remote_car.distance_driven_in_meters + 20,
        battery_percentage: remote_car.battery_percentage - 1}
  end
end
