# Traffic performance report

This example requests a daily listing-impression traffic report for a marketplace and date range, then checks the seller's item-not-as-described customer service rating for the same marketplace.

## Prerequisites

1. Push the connector to the local repository:

    ```bash
    cd ballerina
    bal pack && bal push --repository=local
    ```

2. Create a `Config.toml` in this directory:

    ```toml
    clientId = "<Client ID>"
    clientSecret = "<Client Secret>"
    refreshToken = "<Refresh Token>"
    refreshUrl = "https://api.ebay.com/identity/v1/oauth2/token"
    marketplaceId = "EBAY_US"
    dateRange = "[20260901..20260930]"
    ```

## Run the example

```bash
bal run
```
