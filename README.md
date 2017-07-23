# Garage Door Opener

A web application that serves as a basic garage door opener button.

## WARNING

Running this application on your own home network gives anyone with access to your network to the ability to open your garage door. Proceed with caution.

## Dependencies

[Install Elixir (and erlang)](http://elixir-lang.org/install.html)

[Install Nerves](https://hexdocs.pm/nerves/installation.html)

It'd also be a good idea to checkout the [Nerves Getting Started Guide](https://hexdocs.pm/nerves/getting-started.html) to better understand what is going on here.

## Usage

This application was designed to be burned to a firmware image and run on a Raspberry Pi 3 that is connected to your home wifi.

Other devices/network configurations are possible. Please check the [boilerplate for this project](https://github.com/nerves-project/nerves-examples/tree/master/hello_phoenix) to see how to go about using another configuration


### Steps

Clone the repo and enter into it.
```bash
git clone https://github.com/MainShayne233/garage_door_opener.github
cd garage_door_opener
```

Create `./apps/garage_door_opener/config/network.secret.exs` with your wifi info (this file is `.gitignore`'d and shouldn't be committed).
```elixir
use Mix.Config

config :garage_door_opener, :wlan0,
  ssid: "Your network name",
  key_mgmt: :"WPA-PSK",
  psk: "Your pre-shared-key or wifi password"
```

Insert the SD/microSD card you wish to burn the firmware onto into your computer.

Enter into the main application and install the firmware.
```bash
cd /apps/garage_door_opener
MIX_TARGET=rpi3 mix do deps.get, compile, firmware, firmware.burn
```

You should be prompted to confirm the card the firmware will be burned onto, and once that is complete, you should be able to boot up the firmware on your Raspberry Pi 3. The Phoenix application should be running at whatever IP address your Pi is running on.
