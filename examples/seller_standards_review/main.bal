// Reviews the seller's standards profiles across programs and drills into the current cycle of each one.

import ballerina/io;
import ballerinax/ebay.analytics;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;

public function main() returns error? {
    analytics:Client ebay = check new ({
        auth: {clientId, clientSecret, refreshToken, refreshUrl}
    });

    // Step 1: List the standards profiles for every program the seller participates in.
    analytics:FindSellerStandardsProfilesResponse profiles = check ebay->findSellerStandardsProfiles();
    analytics:StandardsProfile[] standardsProfiles = profiles?.standardsProfiles ?: [];
    io:println("Programs found: ", standardsProfiles.length());

    // Step 2: Fetch the current-cycle profile of each program and report its level.
    foreach analytics:StandardsProfile summary in standardsProfiles {
        string? program = summary?.program;
        if program is () {
            continue;
        }
        analytics:StandardsProfile? current = check ebay->getSellerStandardsProfile("CURRENT", program);
        if current is () {
            io:println(program, ": no current-cycle profile available");
            continue;
        }
        io:println(program, ": ", current?.standardsLevel ?: "UNKNOWN");
        foreach analytics:Metric metric in current?.metrics ?: [] {
            io:println("  ", metric?.metricKey ?: "metric", " = ", metric?.value ?: "n/a");
        }
    }
}
