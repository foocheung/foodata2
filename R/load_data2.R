load_data2 <- function() {
  data <- readxl::read_xlsx(system.file("data", "v4.1_filtered_somamers.xlsx", package = "foodata2"))
  return(data)
}
