# Heltec Esp32 LoRaWan library
This is a Platformio library for Heltec ESP32 boards with integrated LoRa transceivers.
The code is directly ported from the original Heltec Arduino library: https://github.com/Heltec-Aaron-Lee/WiFi_Kit_series

As the specific [LoRaWan Platformio library](https://registry.platformio.org/libraries/heltecautomation/ESP32_LoRaWAN) seems no more being maintained, and it is not compatible with espressif32 platform versions higher than 3.5.0, I decided to create this new library.

## Supported boards
- Heltec WiFi LoRa 32 ([V1](https://docs.platformio.org/en/latest/boards/espressif32/heltec_wifi_lora_32.html) and [V2](https://docs.platformio.org/en/latest/boards/espressif32/heltec_wifi_lora_32_V2.html))
- [Heltec Wireless Stick](https://docs.platformio.org/en/latest/boards/espressif32/heltec_wireless_stick.html)
- [Heltec Wireless Stick Lite](https://docs.platformio.org/en/latest/boards/espressif32/heltec_wireless_stick_lite.html)

## Configuration
You need to define some constants in the `build_flags` option inside `platformio.ini` file.

```ini
[env:esp32]
platform = espressif32
framework = arduino
build_flags =
    -D LoRaWAN_DEBUG_LEVEL=3
    -D LORAWAN_PREAMBLE_LENGTH=8
    -D REGION_EU433
```

To show debug information about LoRa activity on the embedded Oled screen, you can optionally add the `LORA_DISPLAY` constant:
```ini
build_flags =
    -D LoRaWAN_DEBUG_LEVEL=3
    -D LORAWAN_PREAMBLE_LENGTH=8
    -D REGION_EU433
    -D LORA_DISPLAY
```
In this case, you need to add also the Oled library [Heltec_Esp32_Display](https://registry.platformio.org/libraries/eiannone/Heltec_Esp32_Display) to the project dependencies.