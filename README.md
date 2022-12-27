
![](https://mods-data.factorio.com/assets/ad36f974db944b1540ce50a0aea46221f26f7c36.thumb.png)

# Dashboards for [graftorio2](https://mods.factorio.com/mod/graftorio2)

visualize metrics from your Factorio game in Grafana

## What is this?

[Grafana](https://grafana.com/) is an open-source project for rendering time-series metrics.  
by using [graftorio2](https://mods.factorio.com/mod/graftorio2), you can create a dashboard with various charts monitoring aspects of your Factorio factory.  
this dashboard is viewed using a web browser outside of the game client. (works great in a 2nd monitor!)

in order to use graftorio2, you need to run the Grafana software and a database called [Prometheus](https://prometheus.io/) locally.  
graftorio2 automates this process using docker, or you can set these up by hand.

and here are the ready to use dashboards for it!

## Dashboards

All dashboards support a variety of different filters, panel links as well as data links.
For example: `Force`, `TimeScale`, `Network`, `Item / Fluid / Building / etc.`
  - Force: default `player` - some mods provide their own identifyer.
  - TimeScale: default `Minute` - is used to calculate values per `Second / Minute / Hour`.
  - Network: default `all` - depending on context the available networks like `electricity / logistic`.
  - Item / Fluid / Building etc.: default `all` -  depending on context the available entities.

### `Info` - overall stats
  - UPS
  - Game Time (Play Time)
  - Total Players (unique players)
  - Current online players
  - Map Seed
  - Installed mods
  - Evolution
  - Evolution Composition
  - Current research progress
  - research queue
  - total rockets launched
  - rockets per `TimeScale` based on last hour

### `Items` - important items - delta production / consumption
  - Science delta
  - Circuits delta
  - Materials delte (Iron, Copper, Plastic, Steel) 
  - Components delte (Battery, FRF, LDS, RCU, Rocket Fuel) 

### `Default` - rebuild of ingame graphs (as close as possible)
  - 1.1 - Default: Electricity.json
  - 1.2 - Default: Items.json
  - 1.3 - Default: Fluids.json
  - 1.4 - Default: Buildings.json
  - 1.5 - Default: Pollution.json
  - 1.6 - Default: Kills.json
  - 1.7 - Default: Logistics.json

### `Rate` - Various interpretation of "rate"
  - 2.0.1 - Rate: Electricity.json
  - 2.0.2 - Rate: Items.json
  - 2.0.2.1 - Rate: Storage.json
  - 2.0.2.2 - Rate: Science Packs.json
  - 2.0.3 - Rate: Fluids.json
  - 2.0.4 - Rate: Buildings.json
  - 2.0.5 - Rate: Pollution.json
  - 2.0.6 - Rate: Kills.json
  - 2.0.7 - Rate: Evolution.json
  - 2.0.8 - Rate: Research.json
  - 2.0.9 - Rate: Rockets.json
  - 2.1.0 - Rate: Players.json

### `Misc` - detailed presentation in various forms
  - 3.0.1 - Misc: Items.json
  - 3.0.2 - Misc: Buildings.json
  - 3.0.4 - Misc: Logistic Networks.json
  - 3.0.4.1 - Misc: Logistic Items.json
  - 3.0.4.2 - Misc: Robots.json
  - 3.0.5 - Misc: Trains.json

### `Mod` - dashboards dedicated to display mod related information
  - 4.0.1 - Mod: YARM.json

## Contributing

### Grafana dashboards

edit `config/grafana/dashboard.yml` to enable editing of provisioned dashboards.  
you can also create a copy of one dashbaord through the Grafana interface.  

```yaml
#    allowUiUpdates: false
    allowUiUpdates: true
```

make your changes to the dashboards as desired.  
to export all dashboards you can create an API key within Grafana `localhost:3000/org/apikeys`  
and use the provided `grafana-export.sh` 

```sh
grafana-export.sh localhost:3000 ${API_KEY}
```

this script saves the dashboards as `.json` file by folder in your `${PWD}`.  
