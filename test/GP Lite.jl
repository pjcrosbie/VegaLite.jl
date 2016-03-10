module A ; end
reload("VegaLite")
reload("Paper")


module A
using Paper
using VegaLite
import JSON


# config(abcd="trus")
# config(viewport="trus")
# config(viewport=[400,330])
# JSON.json(v.vis)

@session vgtest vbox pad(2em)

@rewire VegaLite.VegaLiteVis

sleep(3.0)
vv = Paper.currentSession.window
push!(vv.assets, ("VegaLite", "vega-lite"))

#-------- draw the header ----------------------------------
@newchunk pg vbox packacross(center) fillcolor("#ddd") pad(1em)

title(2, "Veg Lite")
title(1, "with plots using VegaLite") |> fontstyle(italic)

#------- plot ------------------------------------
@newchunk center


ts = sort(rand(10))
ys = Float64[ rand()*0.1 + cos(x) for x in ts]


v = data_values(time=ts, res=ys) +
      mark_line() +
      encoding_x_quant(:time) +
      encoding_y_quant(:res)

v2 = v + config_scale(round=true)
JSON.print(v2.vis)


v2 = v + config_axis(axisWidth=3.2, labelAngle=45)
v2 = v + config_axis(labelAlign="left")
v2 = v + config_axis(tickPadding=10)
JSON.print(v2.vis)



data_values(time=[ts, reverse(ts)], res=[ys, reverse(ys-0.3)]) +
  mark_area() +
  encoding_x_quant(:time) +
  encoding_y_quant(:res) +
  # encoding_path_quant() +
  config_cell(width=300, height=300)

data_values(posit=[1:2length(ts);], time=[ts, reverse(ts)], res=[ys, reverse(ys-0.3)]) +
  mark_line() +
  encoding_x_quant(:time, scale=Dict(:domain=>[0,1])) +
  encoding_y_quant(:res) +
  encoding_color_nominal("red") +
  encoding_path_ord(:posit) +
  config(background="#eee") +
  config_cell(width=300, height=150, strokeWidth=.6,
              strokeDash=[10,5])


JSON.print(data_values(posit=[1:2length(ts);], time=[ts, reverse(ts)], res=[ys, reverse(ys-0.3)]))
