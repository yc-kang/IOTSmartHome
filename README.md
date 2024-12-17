# IOT Smart Home Project
 
## System Architecture
This is a ESP8266-based system

<div style="vertical-align:middle"><img src="images/Diagram.png" alt="Dataset" width="550px" text-align="center">
</div>

## Circuits & PCB
Schematics, PCBs are designed via [EasyEDA](https://pro.easyeda.com/editor), based on an open-sourced project [this](https://oshwhub.com/zijunchen/esp8266-extension_copy_copy_copy_copy_copy_copy_copy_copy).

The design can be access [here](Altium_NewProject_Schematic_PCB.zip), can be imported into AD or EasyEDA

<div style="vertical-align:middle"><img src="images/Schematic.png" alt="Dataset" width="400px" text-align="center">
</div>

<div style="vertical-align:middle"><img src="images/PCB.png" alt="Dataset" width="400px" text-align="center">
</div>

Prototype
<div style="vertical-align:middle"><img src="images/Prototype.png" alt="Dataset" width="300px" text-align="center">
</div>

## Code Layout
The code is organized as follows:
- ESP8266/Main/ - Main code (ESP8266, in C)
- ESP8266/ManualTest/ - Testing (ESP8266, in C)
- AndroidApp - Flutter (in Dart)

## Android App
Designed via [FlutterFlow](https://www.flutterflow.io/), the app can be access [here](https://app.flutterflow.io/project/hotel-app-eamssf)  
*Currently in beta, not optimized for TabletView, WebApp yet
<div style="vertical-align:middle"><img src="images/AppDesign.png" alt="Dataset" width="550px" text-align="center">
</div>

It is **recommended** to edit in FlutterFlow directly, as oppose to import into Flutter  
Currently, the database is setup on Supabase, it's recommended to switch to Firebase, for better performance
