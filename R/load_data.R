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

excel_serial_to_date <- function(x) {
  # Excel origin for Windows: 1899-12-30
  as.character(as.Date(as.numeric(x), origin = "1899-12-30"))
}

load_data4 <- function() {
  file_path <- system.file("data", "synthetic_data.xlsx", package = "foodata2")
  
  # peek at one row to count columns
  n_cols <- ncol(readxl::read_xlsx(file_path, n_max = 1))
  
  # force ExpDate to text, guess the rest
  col_types <- c("text", rep("guess", n_cols - 1))
  
  data <- readxl::read_xlsx(file_path, col_types = col_types)
  data <- as.data.frame(data, check.names = FALSE)
  
  # clean column names
  colnames(data) <- gsub("`", "", colnames(data))
  
  # fix ExpDate: convert serials into readable dates
  data$ExpDate <- excel_serial_to_date(data$ExpDate)
  
  return(tibble::as_tibble(data))
}

