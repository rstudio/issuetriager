#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


#' Check some text for a phrase
#'
#' @param phrase The phrase to look for.
#' @param issueBody The text to search within.
#' @return A logical vector.
#' @examples
#' checkPhrase('hello', 'you say hello i say goodbye')
checkPhrase <- function(phrase, issueBody) {
  stringr::str_detect(issueBody, phrase)
}


