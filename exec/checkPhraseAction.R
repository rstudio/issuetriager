#!/usr/bin/env RScript

library(issuetriager)

args = commandArgs(trailingOnly=TRUE)
issueBody <- Sys.getenv("INPUT_ISSUE_BODY")

if (length(args)!=1) {
  cat("Exactly one argument must be supplied (input text)\n")
  quit(save = "no", status = 1)
}

result <- checkPhrase(args[1], issueBody)

cat("::set-output name=contains-phrase::",
    ifelse(result, "true", "false"),
    "\n",
    sep = "")
