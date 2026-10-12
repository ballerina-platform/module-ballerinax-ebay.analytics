_Author_:  @DimuthuMadushan \
_Created_: 2026/10/12 \
_Updated_: 2026/10/12 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from eBay Analytics.
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/ebay/analytics/v1/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Added a `summary` to each of the four operations (`getCustomerServiceMetric`, `findSellerStandardsProfiles`, `getSellerStandardsProfile`, `getTrafficReport`) in the original spec, since none had one. The summaries are "Get customer service metric", "Find seller standards profiles", "Get seller standards profile" and "Get traffic report".

2. Replaced the generic `Success` description of the 200 response on all four operations with a description of the returned data.

3. Replaced the templated server URL `https://api.ebay.com{basePath}` (with a `basePath` variable defaulting to `/sell/analytics/v1`) by the concrete URL `https://api.ebay.com/sell/analytics/v1` and removed the `variables` block, so the client's default `serviceUrl` matches the spec.

4. Kept the existing operationIds and schema names unchanged (identity decisions stored in `ai-mappings.json`); the spec had no top-level `security` requirement, but each operation declares `api_auth`, so no change was needed.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --license docs/license.txt --client-methods remote
```

Note: The license year is hardcoded to 2024, change if necessary.
