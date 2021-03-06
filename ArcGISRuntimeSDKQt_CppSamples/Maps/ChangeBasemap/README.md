# Change basemap

Change a map's basemap. A basemap is beneath all layers on a `Map` and is used to provide visual reference for the operational layers.

![](screenshot.png)

## Use case

Basemaps should selected contextually, for example, in maritime applications, it would be more appropriate to use a basemap of the world's oceans as opposed to a basemap of the world's streets.

## How to use the sample

Use the drop down menu to select the active basemap from the list of available basemaps.

## How it works

1. Create a `Map` object.
2. Set the map to the `MapView` object.
3. Choose a new `BasemapStyle` to create a `Basemap` with.
4. Set the basemap on the map.

## Relevant API

* BasemapStyle
* Map
* MapView

## Tags

basemap, map
