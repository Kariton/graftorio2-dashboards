
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

all dashboards support a variety of different filters, panel links as well as data links.
for example: `Force`, `TimeScale`, `Network`, `Surface` `Item / Fluid / Building / etc.`
  - Force: default `player` - some mods provide their own identifyer.
  - TimeScale: default `Minute` - is used to calculate values per `Second / Minute / Hour`.
  - Network: default `all` - depending on context the available networks like `electricity / logistic`.
  - Surface: default `all` - some mods provide their own Surface.
  - Item / Fluid / Building etc.: default `all` -  depending on context the available entities.

not all filters are available on all dashboards.

### `Info` - overall stats
  - UPS
  - game time (play time)
  - total players (unique players)
  - current online players
  - map seed
  - Factorio version / installed mods
  - evolution
  - evolution composition
  - current research progress
  - research ETA
  - research queue
  - total rockets launched
  - average satellite rockets launched based on last hour

### `Items` - important items - delta production / consumption
  - science delta
  - circuits delta
  - materials delta (iron, copper, plastic, steel) 
  - components delta (battery, FRF, LDS, RCU, rocket fuel) 

### `Default` - rebuild of ingame graphs (as close as possible)
  - 1.1 - Default: Electricity
  - 1.2 - Default: Items
  - 1.3 - Default: Fluids
  - 1.4 - Default: Buildings
  - 1.5 - Default: Pollution
  - 1.6 - Default: Kills
  - 1.7 - Default: Logistics

### `Rate` - Various interpretation of "rate"
  - 2.0.1 - Rate: Electricity
  - 2.0.2 - Rate: Items
  - 2.0.2.1 - Rate: Storage
  - 2.0.2.2 - Rate: Science Packs
  - 2.0.3 - Rate: Fluids
  - 2.0.4 - Rate: Buildings
  - 2.0.5 - Rate: Pollution
  - 2.0.6 - Rate: Kills
  - 2.0.7 - Rate: Evolution
  - 2.0.8 - Rate: Research
  - 2.0.9 - Rate: Rockets
  - 2.1.0 - Rate: Players

### `Misc` - detailed presentation in various forms
  - 3.0.1 - Misc: Items
  - 3.0.2 - Misc: Buildings
  - 3.0.3 - Misc: Logistic Networks
  - 3.0.3.1 - Misc: Logistic Items
  - 3.0.3.2 - Misc: Robots
  - 3.0.4 - Misc: Trains

### `Mod` - dashboards dedicated to display mod related information
  - 4.0.1 - Mod: YARM

## Known limitations

1. dashboards are only accurate on constand `UPS`, fluctuating `UPS` will result in inaccurate graphs.  

2. there is a lot of information within the game that dashboards can't represent, information we don't get.  
   for example some missing, despite being useful, metrics are:
     - maximum possible power production
     - accumulator charge
     - total exsisting buildings
     - logistic network requests
     - and many more

(these are limitations of the graftorio2 mod itself)

## Known issues

1. `Info / Research ETA` is under some circumstances highly inaccurate.
     - it's calculation is limited to a `Start` within last two weeks. if the research 'start' is further in the past then the last known date is the `Start` and base of all calculation.
     - same applies to restarting a research: it breaks the calculation entirely. imagine you only needed < 1 second to get to 40% and try to calculate how long it takes to get to 100%.
2. `Default: X` 'per entity' values in the small stats display are not the same as ingame.
     - for some the needed information is not available, for others the calculation is not feasable / recommendable. instead this field shows the 'total' of that metric per entity over the selected timerange.

## Contributing

### Grafana dashboards

edit `config/grafana/dashboard.yml` to enable editing of provisioned dashboards.  

```yaml
#    allowUiUpdates: false
    allowUiUpdates: true
```

you can also create a copy of one dashbaord through the Grafana interface.  

make your changes to the dashboards as desired.  
to export all dashboards you can create an API key within Grafana `localhost:3000/org/apikeys`  
and use the provided `grafana-export.sh` 

```sh
grafana-export.sh localhost:3000 ${API_KEY}
```

this script saves all existing dashboards as `.json` file by folder in your `${PWD}`.  
