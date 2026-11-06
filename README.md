# Ballerina eBay Analytics connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-ebay.analytics/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.analytics/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-ebay.analytics.svg)](https://github.com/ballerina-platform/module-ballerinax-ebay.analytics/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/ebay.analytics.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Febay.analytics)

## Overview

[eBay](https://www.ebay.com/) is a global online marketplace where businesses and individuals buy and sell goods. The eBay Analytics API provides data and information about a seller and their eBay business, including listing performance, traffic reports, seller standards profiles and customer service metrics.

This connector provides a Ballerina client for version 1.3.2 of the eBay Analytics API (`/sell/analytics/v1`), letting integrations retrieve seller performance data without handling the REST details directly.

## Setup guide

To use the eBay Analytics connector, you need an eBay developer account and an OAuth credential with the analytics scope.

1. Sign up for the [eBay Developers Program](https://developer.ebay.com/) and create an application keyset.

2. Note the application's **App ID (Client ID)** and **Cert ID (Client Secret)**.

3. Grant consent for the `https://api.ebay.com/oauth/api_scope/sell.analytics.readonly` scope using the authorization code grant flow, and keep the returned **refresh token**.

4. Keep the token endpoint `https://api.ebay.com/identity/v1/oauth2/token`, which is used as the refresh URL.

## Quickstart

To use the `ebay.analytics` connector in your Ballerina application, update the `.bal` file as follows:

1. Import the `ebay.analytics` module.

    ```ballerina
    import ballerinax/ebay.analytics;
    ```

2. Create a `Config.toml` file with your credentials.

    ```toml
    clientId = "<Client ID>"
    clientSecret = "<Client Secret>"
    refreshToken = "<Refresh Token>"
    ```

3. Create a `analytics:ConnectionConfig` and initialize the client.

    ```ballerina
    configurable string clientId = ?;
    configurable string clientSecret = ?;
    configurable string refreshToken = ?;

    final analytics:Client ebay = check new ({
        auth: {
            clientId,
            clientSecret,
            refreshToken
        }
    });
    ```

4. Invoke the connector operation.

    ```ballerina
    public function main() returns error? {
        analytics:FindSellerStandardsProfilesResponse _ = check ebay->findSellerStandardsProfiles();
    }
    ```

## Examples

The `eBay Analytics` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-ebay.analytics/tree/main/examples/), covering the following use cases:

1. [Seller standards review](examples/seller_standards_review/seller_standards_review.md) - List the seller's standards profiles and inspect the current cycle of each program.
2. [Traffic performance report](examples/traffic_performance_report/traffic_performance_report.md) - Pull a daily traffic report and compare it with the item-not-as-described customer service rating.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`ebay.analytics` package](https://central.ballerina.io/ballerinax/ebay.analytics/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
