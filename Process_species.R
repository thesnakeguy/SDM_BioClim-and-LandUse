# Load necessary libraries
library(rmarkdown)

#### Define the working directory for outputs #####################
workdir <- "C:/Documents and Settings/pdeschepper/Desktop/Maxent"
output_dir <- file.path(workdir, "html")
species_list <- file.path("D:/temp/SDM_Herpetofauna/Snakes/SpeciesList.txt")
###################################################################




# Create the output directory if it doesn’t exist
if (!dir.exists(output_dir)) dir.create(output_dir, recursive = TRUE)

# Read the species list from the text file
sp_list <- readLines(species_list)

# Base parameters that stay constant across reports and override defaults
base_params <- list(
  Workdir = workdir,
  Country = "",
  Continent = "europe",
  Database = "all",
  Limit = 5000,
  ExportRaster = "YES",
  Climate.model = "EC-Earth3-Veg",
  SSP = "245",
  Plot.xmin = -11,
  Plot.xmax = 36,
  Plot.ymin = 33,
  Plot.ymax = 65
)

# Loop through each species and render an HTML report
for (species in sp_list) {
  print(paste("Processing species:", species))
  # Update species-specific parameter
  params <- base_params
  params$Species <- species  # Set the species for this iteration
  
  # Define the output file path
  output_file <- file.path(output_dir, paste0(gsub(" ", "_", species), ".html"))
  
  # Render the R Markdown document for each species
  rmarkdown::render("D:/KMMA_documents/Rscripts/Markdown/SDM_Maxent/Maxent_SDM.Rmd",
                    params = params,
                    output_file = output_file,
                    envir = new.env())
  
  cat("Report generated for species:", species, "\n")
}
