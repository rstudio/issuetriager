
<!-- README.md is generated from README.Rmd. Please edit that file -->

# issuetriager docker action

<!-- badges: start -->

![package
test](https://github.com/rstudio/issuetriager/actions/workflows/check-standard.yml/badge.svg)
![package
test](https://github.com/rstudio/issuetriager/actions/workflows/render-rmarkdown.yml/badge.svg)
<!-- badges: end -->

The goal of issuetriager is to streamline the triage process for
projects that have frequent issues reported on GitHub. Normal use is
inside of a GitHub workflow that is triggered to run when issues are
opened, analyze the text, and use the results for automatic labeling,
closing, or notification about issues.

This action indicates whether the phrase was found within the text or
not.

## Inputs

inputs: check-phrase: \# id of input description: ‘A phrase to look for
in the text’ required: true default: “I'm stuck because of this issue.:
True” issue-body: description: ‘The text body that you want to check for
the phrase’ required: true default: \${{ github.event.issue.body }}
outputs: contains-phrase: \# id of output description: ‘Whether the
check phrase was found’

## `check-phrase`

**Required** The phrase to search for in the issue body. Default
`"I'm stuck because of this issue.: True"`.

## `issue-body`

**Required** The text body that you want to search for the phrase.
Default `"${{ github.event.issue.body }}"`.

## Outputs

## `contains-phrase`

Whether the check phrase was found

## Example usage

    on:
      issues:
        types: [opened]

    jobs:
      triage:
        runs-on: ubuntu-latest
        name: A job to triage issues
        steps:
          - name: check the text
            id: triage
            uses: rstudio/issuetriager@v1
            with:
              check-phrase: 'this is a blocking issue'
              issue-body: ${{ github.event.issue.body }}
          # Use the output from the `triage` step
          - name: Label the issue as blocking
            run: echo "The time was ${{ steps.hello.outputs.time }}"
            if: ${{ steps.triage.outputs.contains-phrase }}
            uses: andymckay/labeler@master
            with:
              add-labels: "blocking"

## Development

Clone this repo from GitHub, and open the project file in RStudio IDE.

    # CTRL-SHIFT-L to load the package

    # SHIFT-CMD-T to run tests

<!-- 
GitHub Actions will re-render `README.Rmd` every time you push.
-->
