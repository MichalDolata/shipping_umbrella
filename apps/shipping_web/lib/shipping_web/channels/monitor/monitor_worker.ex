defmodule ShippingWeb.MonitorChannelWorker do
  use GenServer

  alias Shipping.Tracker.Events.DriverPositionChanged

  @name __MODULE__
  
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @name)
  end

  def init([]) do
    Shipping.PubSub.subscribe("driver_position_changed", self())

    {:ok, []}
  end

  def handle_info(%DriverPositionChanged{} = event, state) do
    ShippingWeb.Endpoint.broadcast! "monitor:lobby", "monitor_msg", 
      event
    {:noreply, state}
  end
end