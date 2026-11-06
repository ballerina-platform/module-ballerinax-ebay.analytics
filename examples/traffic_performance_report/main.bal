// Pulls a daily traffic report for a marketplace and compares it with the customer service rating.

import ballerina/io;
import ballerinax/ebay.analytics;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string marketplaceId = "EBAY_US";
configurable string dateRange = ?;

public function main() returns error? {
    analytics:Client ebay = check new ({
        auth: {clientId, clientSecret, refreshToken, refreshUrl}
    });

    // Step 1: Request daily listing impressions for the configured date range.
    string filter = string `marketplace_ids:{${marketplaceId}},date_range:${dateRange}`;
    analytics:Report report = check ebay->getTrafficReport({}, {
        dimension: "DAY",
        metric: "LISTING_IMPRESSION_TOTAL",
        filter
    });
    io:println("Report covers ", report?.startDate ?: "?", " to ", report?.endDate ?: "?");
    io:println("Daily records: ", (report?.records ?: []).length());

    // Step 2: Check how the seller rates on item-not-as-described cases for the same marketplace.
    analytics:GetCustomerServiceMetricResponse metrics = check ebay->getCustomerServiceMetric(
        "ITEM_NOT_AS_DESCRIBED", "CURRENT", {}, {evaluationMarketplaceId: marketplaceId});
    foreach analytics:DimensionMetric dimensionMetric in metrics?.dimensionMetrics ?: [] {
        foreach analytics:Metric metric in dimensionMetric?.metrics ?: [] {
            io:println(metric?.metricKey ?: "metric", " rating: ", metric?.benchmark?.rating ?: "n/a");
        }
    }
}
