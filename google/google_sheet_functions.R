# ---------------------------------------------------------------------------- #

## this function fetches the google sheet containing the description of the RNA samples
retrieve_sample_sheet = function(google_key, path=NULL){

    library(googlesheets)

    
    if(is.null(path))
        path='~/'

    token_path = file.path(path, '/googlesheets_token_EPS.rds')
    if(!file.exists(token_path)){
        token <- gs_auth(cache = FALSE, key=google_key)
        saveRDS(token, file = token_path)
    }
    suppressMessages(gs_auth(token = token_path, verbose = FALSE))
    gap = gs_key(key)
    return(gap)
}

