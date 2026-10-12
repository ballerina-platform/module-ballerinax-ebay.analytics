# Seller standards review

This example lists the seller's standards profiles across all programs, then fetches the current-cycle profile of each program and prints its standards level and metrics.

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
    ```

## Run the example

```bash
bal run
```
