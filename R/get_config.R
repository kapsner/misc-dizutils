#' @title get_config helper function
#'
#' @description Internal function to read config files
#'
#' @param config_file A character string. The path to the config.yml-file
#'   containing the database configuration.
#' @param config_key A character string. The name of the corresponding
#'   database. This string must be conform with the corresponding config
#'   section in the config.yml-file.
#'
#' @inheritParams feedback
#'
#' @export
#'
get_config <-
  function(config_file,
           config_key,
           logfile_dir,
           headless) {
    res <- tryCatch({
      config::get(config_key, file = config_file)
    },
    error = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      feedback(
        print_this = paste0("Cannot access config_file. ", cond),
        type = "Error",
        findme = "e3e1b9c5f9",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    },
    warning = function(cond) {
      cond <- paste(unlist(cond), collapse = " ")
      feedback(
        print_this = paste0("Cannot access config_file. ", cond),
        type = "Warning",
        findme = "718e0f3d88",
        logfile_dir = logfile_dir,
        headless = headless
      )
      return(NULL)
    })
    return(res)
  }