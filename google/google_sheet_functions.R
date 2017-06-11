# ---------------------------------------------------------------------------- #
fetchGoogleSheet = function(key, prefix=NULL){

    library(googlesheets)

    
    if(is.null(prefix))
        prefix='~/'

    token_path = file.path(prefix, '/googlesheets_token_EPS.rds')
    if(!file.exists(token_path)){
        token <- gs_auth(cache = FALSE, key=key)
        saveRDS(token, file = token_path)
    }
    suppressMessages(gs_auth(token = token_path, verbose = FALSE))
    gap = gs_key(key)
    return(gap)
}

