library(tidyverse)
library(ussf)
library(sf)

###############################Bill Beeman's Boundaries/USSF####################

us_counties18sf <- boundaries(geography="county")
us_states18sf <- boundaries(geography="state")
us_counties18sf_ky <- subset(us_counties18sf,STATEFP %in% c("21"))
us_counties18_easternky <- subset(us_counties18sf_ky,COUNTYFP %in% c("195","119","133","153",
                                                                     "115","159","127","175",
                                                                     "205","063","043","019",
                                                                     "089","135","161","201",
                                                                     "023","191","081","077",
                                                                     "015","117","037","069",
                                                                     "011","165","237","025",
                                                                     "129","197","065","173",
                                                                     "181","017","097","049",
                                                                     "151","067","239","113",
                                                                     "079","167","021","137",
                                                                     "187","041","223","103",
                                                                     "211","073","005","231",
                                                                     "147","235","013","095",
                                                                     "193","131","051","189",
                                                                     "109","203","199","125",
                                                                     "121"))
us_counties18_floydco <- subset(us_counties18sf_ky,COUNTYFP %in% c("071"))
us_states18sf <- subset(us_states18sf, STATEFP %in% c("21"))


floyd_co_ky <- ggplot() +
  geom_sf(data=us_counties18_easternky, fill="#ffffff", color="#262626", lwd=.5, show.legend=NA)+
  geom_sf(data=us_counties18_floydco, fill="#0D8C98", color="#262626", lwd=.5, show.legend=NA)+
  geom_sf(data=us_states18sf, fill=NA, color="#262626", lwd=1, show.legend = NA)+
  theme(text = element_text(family="Roboto Condensed"),
        legend.key.size = unit(1.5,"line"),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        plot.margin = margin(r=20,t=10,l=20,b=1),
        legend.position="bottom",
        legend.key = element_blank(),
        legend.background = element_blank(),
        legend.text = element_text(colour="#131521", size=8),
        legend.box.spacing = margin(1),
        legend.margin = margin(t=20),
        legend.box.margin=margin(t=-10),
        legend.title = element_text(colour="#131521", size=10),
        panel.grid.major = element_blank(),
        panel.background = element_blank())

