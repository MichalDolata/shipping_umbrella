defmodule ShippingWeb.MonitorChannel do
  use ShippingWeb, :channel

  def join("monitor:lobby", payload, socket) do
    {:ok, socket}
  end

  def handle_info(%Shipping.Tracker.Events.DriverPositionChanged{} = event, socket) do
    IO.puts("TEST")
    push socket, "monitor_msg", %{"test" => "ok"}
    {:noreply, socket}
  end
end
