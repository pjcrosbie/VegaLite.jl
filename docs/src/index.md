# VegaLite.jl

## Overview

[VegaLite.jl](https://github.com/fredo-dedup/VegaLite.jl) is a plotting package for the [julia](https://julialang.org/) programming language. The package is based on [Vega-Lite](https://vega.github.io/vega-lite/), which extends a traditional [grammar of graphics](https://doi.org/10.1007/0-387-28695-0) API into a [grammar of interactive graphics](https://doi.org/10.1109/TVCG.2016.2599030).

[VegaLite.jl](https://github.com/fredo-dedup/VegaLite.jl) allows you to create a wide range of statistical plots. It exposes the full functionality of the underlying [Vega-Lite](https://vega.github.io/vega-lite/) and is a the same time tightly integrated into the julia ecosystem. Here is an example of a scatter plot:

```@example
using VegaLite, VegaDatasets

dataset("cars") |>
@vlplot(
    :point,
    x=:Horsepower,
    y=:Miles_per_Gallon,
    color=:Origin,
    width=400,
    height=400
)
```

## Installation

To install [VegaLite.jl](https://github.com/fredo-dedup/VegaLite.jl), run the following julia code:

```julia
Pkg.add("VegaLite")
```