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

### Hardware Steps

Now that you have the running app, all that is left connecting your Raspberry Pi 3 to whatever hardware you're going to use to open your garage door. The app is setup up so that when you click/press the button, `PIN 18` on the Raspberry Pi turns on for 1 second, so you just need to set it up so that triggers your garage door to open.

 Personally, I just ripped open my garage door opener's remote, electric-taped down the button on the circuit board, removed the battery, and then connected (also with electric tape) a GPIO and ground pin from the Raspberry Pi to the battery holder, so that when the pin turns on, it's simulates the state of their being a battery while the button is pressed down. This is very crude, but totally works!

 ### Reporting Issues

 If you tried to follow these steps and ran into problems, please open a an issue! I'd love to see what is going on and help you with any problem you might face.
