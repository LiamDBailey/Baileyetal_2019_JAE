[![DOI](https://zenodo.org/badge/187512335.svg)](https://zenodo.org/badge/latestdoi/187512335)

# Baileyetal_2019_JAE
Code and data to reproduce results from Bailey et al. 2019 in Journal of Animal Ecology

This repository includes all the code and data necessary to replicate the results and figures in Bailey et al. 2019 published in the Journal of Animal Ecology.

## Repository structure.

The repository is structured using the framework of an R package.

- All data are saved as `.rda` files in the package `./data` folder.
- All analyses and plot creation is included as vignettes in the `./vignettes` folder.
- Descriptions of all data used for the analyses are stored in `./man`.

## Working with the repository

This repository functions as an R package. The easiest way to access all data and run code is by loading the package in R. This can be done using the binary associated with the latest release or using `devtools::install_github`.
