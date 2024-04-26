library(leaflet)

lng = c( -71.168346,  -0.127696,-73.480052, -122.6, -79.256992, 
         -110.676458,-79.870254, -74.001713, -79.643555, -64.782294)

lat = c(46.798941, 51.507351, 45.525560, 49.216667, 43.875400, 50.039968,  
        43.516398, 45.663616, 43.588424, 46.086599)

municipality = c("Lévis", "London", "Longueuil", 
                 "Maple Ridge", "Markham", "Medicine Hat", 
                 "Milton", "Mirabel", "Mississauga", "Moncton")

province = c("Quebec", "Ontario", "Quebec", "British Columbia", "Ontario", 
             "Alberta", "Ontario", "Quebec", "Ontario", "New Brunswick")

status = c("Ville", "City", "Ville", "City", "City", "City", 
           "Town", "City", 	"City", "City")

area = c(448.07, 420.5, 115.77, 267.82, 210.93, 111.97, 363.83, 484.09, 292.74,
         140.67)

pop_96 = c(129726, 7460385,  243262, 35931, 159832, 53043, 32104, 22689,
           544382, 59313)

pop_01 = c(135824, 7559922 , 250996, 40810, 182511, 54491, 31471, 27315,
           612925, 61046)

pop_06 = c(143923, 7971941, 261695, 44282, 206774, 56142, 53939, 34626,
           668549, 64128)

pop_11 = c(152088, 8173941, 274621, 48610, 238524, 57252, 84362, 41957,
           713443, 69074)

pop_16 = c(161408, 8675454, 288783, 52793, 276303, 60509, 110128, 50513, 
           721599, 71889)

datainsert = data.frame(lng, lat, municipality, province, status, area,
                        pop_96, pop_01, pop_06, pop_11, pop_16)

small_color <- colorNumeric(palette = "Red", domain = datainsert$pop_16)

medium_color <- colorNumeric(palette = "Blue", domain = datainsert$pop_16)

big_color <- colorNumeric(palette = "Yellow", domain = datainsert$pop_16)

small_data <- datainsert[datainsert$pop_16 <= 60000,]

medium_data <- datainsert[datainsert$pop_16 > 60000 & datainsert$pop_16 <= 100000,]

big_data <- datainsert[datainsert$pop_16 > 100000,]

poppercent <- datainsert$pop_16 - datainsert$pop_96

leaflet() %>% 
  addTiles(group="Базовый") %>%
  addCircleMarkers(data = small_data, lng = ~lng, lat = ~lat, radius = 5,
                   color= ~small_color(pop_16), group="Малые города",
                   popup = ~paste0("<b>", municipality, "</b>", "-",
                                   "<b>", province, "</b>", "(",
                                   "<b>", status, "</b>", ")", "<br>",
                                   "Численность населения за 20 лет изменилась на ", 
                                   signif(poppercent, digits = 3 ), " тысяч человек")) %>%
  addCircleMarkers(data = medium_data, lng = ~lng, lat = ~lat, radius = 5,
                   color= ~medium_color(pop_16), group="Средние города",
                   popup = ~paste0("<b>", municipality, "</b>", "-",
                                   "<b>", province, "</b>", "(",
                                   "<b>", status, "</b>", ")", "<br>",
                                   "Численность населения за 20 лет изменилась на ", 
                                   signif(poppercent, digits = 3 ), " тысяч человек")) %>%
  addCircleMarkers(data = big_data, lng = ~lng, lat = ~lat, radius = 5,
                   color= ~big_color(pop_16), group="Большие города",
                   popup = ~paste0("<b>", municipality, "</b>", "-",
                                   "<b>", province, "</b>", "(",
                                   "<b>", status, "</b>", ")", "<br>",
                                   "Численность населения за 20 лет изменилась на ", 
                                   signif(poppercent, digits = 3 ), " тысяч человек")) %>%
  
  addLayersControl(baseGroups=c("Базовый", "Esri", "Stamen", "OpenTopoMap"),
                   overlayGroups=c("Большие города", "Средние города", "Малые города"),
                   options=layersControlOptions(collapsed=FALSE))