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
  data <- readxl::read_xlsx(system.file("data", "synthetic_data.xlsx", package = "foodata2"))
  data <- as.data.frame(data, check.names = FALSE)
  return(data)
}
