load_data <- function() {
  data <- readRDS(system.file("data", "pheno.RDS", package = "foodata2"))
  return(data)
}


load_data2 <- function() {
  data <- readxl::read_xlsx(system.file("data", "v4.1_filtered_somamers.xlsx", package = "foodata2"))
  return(data)
}


load_data3 <- function() {
  data <- SomaDataIO::read_adat(system.file("data", "example_data_v4.1_plasma.adat", package = "foodata2"))
  return(data)
}

load_data3B <- function() {
  data <- SomaDataIO::parseHeader(system.file("data", "example_data_v4.1_plasma.adat", package = "foodata2"))
  return(data)
}

load_data4 <- function() {
  # read the Excel file, force first column (ExpDate) to text
  data <- readxl::read_xlsx(
    system.file("data", "synthetic_data.xlsx", package = "foodata2"),
    col_types = c("text", rep("guess", readxl::ncol_readxl(
      system.file("data", "synthetic_data.xlsx", package = "foodata2")
    ) - 1))
  )
  
  # keep original names (don't convert to syntactic)
  data <- as.data.frame(data, check.names = FALSE)
  
  # strip stray backticks
  colnames(data) <- gsub("`", "", colnames(data))
  
  # return as tibble
  data <- tibble::as_tibble(data)
  
  return(data)
}
