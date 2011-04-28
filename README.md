Behavioural Tests for Unbooked
==============================

A fork of [Andrew Krespanis's Behaviour project](https://github.com/andrewk/behaviour). Check out [that project's documentation](https://github.com/andrewk/behaviour/blob/master/README.md) for a guide on how to get it set up.

Configuration
-------------

Copy `features/support/local.rb.default` to `features/support/local.rb` and edit that file as needed.

Configuration of Unbooked
-------------------------

You'll need to set `allow-behavioural-tests` to `true` in Unbooked's configuration before running these tests. Without this configuration the tests won't be able to load their fixtures.

Running the Tests
-----------------

Running the tests is as simple as:

	$ cucumber features

After a few minutes, you'll hopefully see something like:

	99 scenarios (99 passed)
	999 steps (999 passed)
	9m59.998s

If you don't, something failed in the tests and it's your job to fix it.

Data
----

Each time a test is run, it blows away any data on your local development copy and replaces it with what's in [the behavioural test fixture](https://github.com/wavedigital/unbooked/blob/develop/app/data/fixtures/behaviouraltest.yml).