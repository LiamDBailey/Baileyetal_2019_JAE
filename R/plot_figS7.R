#' Make grid plot of 2013 - 2016 settlement
#'
#' Plot showin settlement of H. ostralegus between
#' 2013 and 2016 overlayed on a) fledglin output,
#' b) conspecific density, c) elevation.
#' @param palette Colour-brewer palette to use.
#'
#' @return ggplot object.
#' @export
#' @import rgdal
#' @import raster
#' @import ggplot2
#' @import dplyr
#' @import extrafont
#' @importFrom utils data

plot_figS7 <- function(palette = "Greens"){

  #Clip to only include the gully inside the grid squares and turn into layer for ggplot
  GULLY_plot <- fortify(raster::intersect(GULLY, GRID))

  chosen_yr_range <- 2013:2016

  #Turn GRIDS into usable ggplot format with fortify
  #POLY_ID will be used to link it back to settlements, fledgling etc.
  #Join this with the info from SETTLE_poisson
  GRID_plot <- fortify(GRID, region = "POLY_ID") %>%
    dplyr::left_join(., filter(SETTLE_poisson, Year %in% chosen_yr_range) %>%
                       rename(id = POLY_ID)  %>%
                       group_by(id) %>%
                       summarise(nr_Settle = sum(nr_Settle) != 0,
                                 Elev = max(Median2)), by = "id") %>%
    rowwise() %>%
    mutate(Elev = ifelse(Elev > 200, 200, Elev)) %>%
    #Also join the mean density and number of fledglings
    left_join(., filter(GRID_DENSITY, Year %in% chosen_yr_range) %>%
                rename(id = ID) %>%
                group_by(id) %>%
                summarise(mean_dens = mean(DENSITY)), by = "id") %>%
    left_join(., filter(Raw_fledge_data, Year %in% chosen_yr_range) %>%
                rename(id = POLY_ID) %>%
                group_by(id) %>%
                summarise(mean_fledge = sum(Fledge_est)), by = "id") %>%
    #When there is no territory centre points in a grid square make it a 0 fledgling value (currently not listed)
    rowwise() %>%
    mutate(mean_fledge = ifelse(is.na(mean_fledge), 0, mean_fledge)) %>%
    #Filter out grid squares over the side
    filter(!is.na(Elev))

  (fledge_plot <- ggplot()+
      geom_polygon(data = GRID_plot, aes(x = long, y = lat, group = group, fill = as.factor(mean_fledge)), colour = "grey", size = 0.5)+
      geom_polygon(data = GULLY_plot, aes(x = long, y = lat, group = group), fill = scales::muted("blue"), alpha = 0.5)+
      geom_path(data = GRID_plot %>% filter(nr_Settle == 1), aes(x = long, y = lat, group = group), colour = "black", size = 1,
                lineend = "square", linejoin = "mitre")+
      coord_equal()+
      theme_ubuntu(legend = "left")+
      theme(axis.line = element_blank(),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            axis.title = element_blank(),
            legend.direction = "horizontal",
            legend.position = c(0.2, 0.7),
            legend.title = element_text(family = "Ubuntu", hjust = 0.5, size = 12),
            legend.text = element_text(family = "Ubuntu", size = 10),
            legend.background = element_blank())+
      guides(fill = guide_legend(title.position = "top", barwidth = unit(4, units = "cm"),
                                 ticks.colour = "black", frame.colour = "black"))+
      scale_fill_brewer(type = "seq", palette = palette, direction = 1,
                        aesthetics = "fill", name = "Conspecific fledglings \n (2013 - 2016)",
                        breaks = seq(0, 3, 1)))

  (dens_plot <- ggplot()+
      geom_polygon(data = GRID_plot, aes(x = long, y = lat, group = group, fill = mean_dens), colour = "grey", size = 0.5)+
      geom_polygon(data = GULLY_plot, aes(x = long, y = lat, group = group), fill = scales::muted("blue"), alpha = 0.5)+
      geom_path(data = GRID_plot %>% filter(nr_Settle == 1), aes(x = long, y = lat, group = group),
                lineend = "square", linejoin = "mitre", colour = "black", size = 1)+
      coord_equal()+
      theme_ubuntu(legend = "left")+
      theme(axis.line = element_blank(),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            axis.title = element_blank(),
            legend.direction = "horizontal",
            legend.position = c(0.2, 0.7),
            legend.title = element_text(family = "Ubuntu", hjust = 0.5, size = 12),
            legend.text = element_text(family = "Ubuntu", size = 10),
            legend.background = element_blank())+
      guides(fill = guide_colourbar(title.position = "top", barwidth = unit(4, units = "cm"),
                                    ticks.colour = "black", frame.colour = "black"))+
      scale_fill_distiller(type = "seq", palette = palette, direction = 1,
                           aesthetics = "fill", name = "Conspecific density \n (2013 - 2016)"))

  (elev_plot <- ggplot()+
      geom_polygon(data = GRID_plot, aes(x = long, y = lat, group = group, fill = Elev), colour = "grey", size = 0.5)+
      geom_polygon(data = GULLY_plot, aes(x = long, y = lat, group = group), fill = scales::muted("blue"), alpha = 0.5)+
      geom_path(data = GRID_plot %>% filter(nr_Settle == 1), aes(x = long, y = lat, group = group), colour = "black", size = 1,
                lineend = "square", linejoin = "mitre")+
      coord_equal()+
      theme_ubuntu(legend = "left")+
      theme(axis.line = element_blank(),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            axis.title = element_blank(),
            legend.direction = "horizontal",
            legend.position = c(0.2, 0.7),
            legend.title = element_text(family = "Ubuntu", hjust = 0.5, size = 12),
            legend.text = element_text(family = "Ubuntu", size = 10),
            legend.background = element_blank())+
      guides(fill = guide_colourbar(title.position = "top", barwidth = unit(4, units = "cm"),
                                    ticks.colour = "black", frame.colour = "black"))+
      scale_fill_distiller(type = "seq", palette = palette, direction = 1,
                           aesthetics = "fill", name = "Elevation \n (cm above MHT)",
                           breaks = c(0, 50, 100, 150, 200),
                           labels = c("0", "50", "100", "150", ">200"),
                           limits = c(0, 200)))

  print(cowplot::plot_grid(fledge_plot, dens_plot, elev_plot, nrow = 1, labels = c("a)", "b)", "c)"),
                     label_fontfamily = "Ubuntu", label_y = 0.95, label_x = 0.05))

}
