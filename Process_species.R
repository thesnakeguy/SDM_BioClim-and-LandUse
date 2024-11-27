# Load necessary libraries
library(rmarkdown)

#### Define the working directory for outputs #####################
workdir <- "D:/temp/SDM_Herpetofauna/Maxent_HighRes_SSP245SSP585/"
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
  Database = "gbif",
  Limit = 1500,
  ExportRaster = "YES",
  Range = "YES",
  Climate.model = "MPI-ESM1-2-HR",
  Ncores = 10,
  SSP = "245",
  Plot.xmin = "-11",
  Plot.xmax = "33",
  Plot.ymin = "34",
  Plot.ymax = "65"
)

# Loop through each species and render an HTML report
for (species in sp_list) {
  print(paste("Processing species:", species))
  
  # Update species-specific parameter
  params <- base_params
  params$Species <- species  # Set the species for this iteration
  
  # Define the output file path
  output_file <- file.path(output_dir, paste0(gsub(" ", "_", species), ".html"))
  
  # Check if output file already exists; skip if it does
  if (file.exists(output_file)) {
    cat("Output already exists for species:", species, "- skipping to next species.\n")
    next  # Skip to the next iteration
  }
  
  # Use tryCatch to handle errors and continue the loop
  tryCatch({
    rmarkdown::render("D:/KMMA_documents/Rscripts/Markdown/SDM_Maxent/Maxent_SDM_HighRes.Rmd",
                      params = params,
                      output_file = output_file,
                      envir = new.env())
    cat("Report generated for species:", species, "\n")
  }, error = function(e) {
    cat("Error encountered for species:", species, "- skipping to next species.\n")
  })
}

