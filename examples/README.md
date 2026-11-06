# Examples

The `ballerinax/ebay.analytics` connector provides practical examples illustrating usage in various scenarios.

1. [Seller standards review](./seller_standards_review/seller_standards_review.md) - List standards profiles and inspect the current cycle of each program.
2. [Traffic performance report](./traffic_performance_report/traffic_performance_report.md) - Pull a daily traffic report and check the customer service rating.

## Prerequisites

Push the connector to the local repository with `bal pack && bal push --repository=local` from the `ballerina` directory, and provide eBay OAuth credentials (`clientId`, `clientSecret`, `refreshToken`, `refreshUrl`) in a `Config.toml` in the example directory.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
