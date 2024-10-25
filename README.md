# Maxent SDM using BioClim and Land Use Data

## Overview
This RMarkdown script provides a framework for Species Distribution Modeling (SDM) and ecological niche analysis under present and future climate scenarios. Using MaxEnt, it models species distributions based on both **BioClim** and **Land Use** data.
It also enables future projections based on CMIP6 climate models and SSP (Shared Socioeconomic Pathway) scenarios.

## Features
- **Species Record Retrieval**: Extracts georeferenced records from GBIF, iNaturalist, or Observation.org based on species name, country, and continent.
- **Climate and Land Use Data**: Incorporates WorldClim’s BioClim variables and land use data (e.g., vegetation, population density).
- **Database selection**: Choose between gbif, inaturalist and observation.org as data sources for species occurrences and set restrictions regarding country/continent.
- **Future Projections**: Models species distribution under CMIP6 climate models across SSPs 126, 245, 370, and 585 for 2041-2060 and 2061-2080.
- **Custom Plotting**: Visualize the predicted SDM or ecological niche within specified coordinate ranges.

## Usage
Clone this repository and run the script in an R environment. To specify parameters, edit them within the `params` list or interact with the interface in RStudio.

### Key Parameters
| Parameter       | Description                                           |
|-----------------|-------------------------------------------------------|
| Species         | Scientific name of the species                        |
| Country         | Optional 2-letter country code                        |
| Continent       | Select continent or specify `all`                     |
| Database        | Choose from `gbif`, `inaturalist`, `observation`      |
| Climate.model   | CMIP6 climate model for future predictions            |
| SSP             | Shared Socioeconomic Pathway (126, 245, 370, 585)     |
| Working Directory | Path to save results                                |

### Requirements
The script requires the following packages:
- `dismo`, `raster`, `rgbif`, `sf`, `rmaxent`, `rJava`, `rasterVis`, `viridis`, `geodata`, `ggplot2`, `stringr`, `rnaturalearth`, `caret`

### BioClim and Land Use Variables
- **BioClim**: 19 variables including temperature and precipitation measures.
- **Land Use**: Variables representing vegetation, built environments, water bodies, population density, human footprint, and elevation.

For more details on Land Use data, see [geodata documentation](https://github.com/rspatial/geodata).

## License
This project is licensed under the MIT License. Contributions and improvements are welcome!
