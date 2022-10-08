test_body <- 'This is an example issue body.
  it does not contain the phrase we are searching for
  so this should return false'

test_that("no phrase found works", {
  expect_false(checkPhrase('issue body BOING', test_body))
})

test_that("finding the phrase works", {
  expect_true(checkPhrase('issue body', test_body))
})
