defmodule ShippingWeb.MonitorChannel do
  use ShippingWeb, :channel

  def join("monitor:lobby", payload, socket) do
    {:ok, socket}
  end
end
