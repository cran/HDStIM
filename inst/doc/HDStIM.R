## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----con_table----------------------------------------------------------------
matrix(c(60, 40, 20, 80),nrow = 2, ncol = 2, 
       dimnames = list(c("Cluster1", "Cluster2"), c("Stim", "Unstim")))

## ----example------------------------------------------------------------------
library(HDStIM)

mapped_data <-  HDStIM(chi11$expr_data, chi11$state_markers,
                       chi11$cluster_col, chi11$stim_label,
                       chi11$unstim_label, seed_val = 123, 
                       umap = TRUE, umap_cells = 500, 
                       verbose = FALSE)

class(mapped_data)

attributes(mapped_data)

## ----head_expr----------------------------------------------------------------
head(mapped_data$response_mapping_main)

## ----head_stacked-------------------------------------------------------------
head(mapped_data$stacked_bar_plot_data)

## ----head_umap----------------------------------------------------------------
head(mapped_data$umap_plot_data)

## ----head_all_F---------------------------------------------------------------
head(mapped_data$all_fisher_p_val)

## ----head_all_K---------------------------------------------------------------
head(mapped_data$all_k_means_data)

## ----k_plots, fig.width = 4, fig.align = "center", dpi = 150------------------
k_plots <- plot_K_Fisher(mapped_data, path = NULL, verbose = FALSE)
k_plots[[1]]

## ----u_plots, fig.width = 4, fig.align = "center", dpi = 150------------------
u_plots <- plot_umap(mapped_data, path = NULL, verbose = FALSE)
u_plots[[1]]

## ----e_plots, fig.width = 7, fig.height = 5, fig.align = "center"-------------
e_plots <- plot_exprs(mapped_data, path = NULL,verbose = FALSE)
library(ggplot2)
e_plots[[1]] +
    theme(text = element_text(size = 11))

## ----m_ranks, fig.width = 7, fig.height = 6, fig.align = "center"-------------
m_ranks <- marker_ranking_boruta(mapped_data, path = NULL, n_cells = NULL,
                                 max_runs = 100, seed_val = 123,
                                 verbose = FALSE)

head(m_ranks$attribute_stats)

m_ranks$plots[[1]]

