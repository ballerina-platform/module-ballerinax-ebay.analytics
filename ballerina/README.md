## Overview

[eBay](https://www.ebay.com/) is a global online marketplace where businesses and individuals buy and sell goods. The eBay Analytics API provides data and information about a seller and their eBay business, including listing performance, traffic reports, seller standards profiles and customer service metrics.

This connector provides a Ballerina client for version 1.3.2 of the eBay Analytics API (`/sell/analytics/v1`), letting integrations retrieve seller performance data without handling the REST details directly.

### Key features

- Retrieve traffic reports with configurable dimensions, metrics, filters and sorting
- Review seller standards profiles for every program or for a single program and cycle
- Check customer service metrics and peer benchmarks for a marketplace
- Authenticate with an OAuth 2.0 refresh token or a bearer token

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

1. [Seller standards review](../examples/seller_standards_review/seller_standards_review.md) - List the seller's standards profiles and inspect the current cycle of each program.
2. [Traffic performance report](../examples/traffic_performance_report/traffic_performance_report.md) - Pull a daily traffic report and compare it with the item-not-as-described customer service rating.

