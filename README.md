# Criterion benchmark suite for the [Airship](https://github.com/helium/airship) routing

This is a small benchmark suite I put together to test the performance
of some changes to the Airship routing and to provide comparision to
the performance of the current routing code.

## Getting started

1. Clone [Airship](https://github.com/helium/airship).
1. Update the Airship dependency in the `stack.yaml` file to use the
   desired version of Airship.
1. You will need to export two additional functions that are normally
   not exposed in the `Airship.Route` module. Add `runRouter` and
   `route` to the export list.
1. Clone and build this repo: `stack build`
1. Run the test. The following will run the test and generate and html
   file with graphs of the results in the local directory: `stack exec
   airship-route-bench -- --output airship-route-bench.html`
