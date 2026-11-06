// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.ebay.com/sell/analytics/v1" : "http://localhost:9090";
final string token = isLiveServer ? os:getEnv("EBAY_ANALYTICS_TOKEN") : "test_token";

final Client ebay = check new ({auth: {token}, httpVersion: http:HTTP_1_1}, serviceUrl);

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCustomerServiceMetric() returns error? {
    GetCustomerServiceMetricResponse response = check ebay->getCustomerServiceMetric(
        "ITEM_NOT_AS_DESCRIBED", "CURRENT", {}, {evaluationMarketplaceId: "EBAY_US"});
    test:assertTrue(response?.dimensionMetrics !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testFindSellerStandardsProfiles() returns error? {
    FindSellerStandardsProfilesResponse response = check ebay->findSellerStandardsProfiles();
    test:assertTrue((response?.standardsProfiles ?: []).length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSellerStandardsProfile() returns error? {
    StandardsProfile? response = check ebay->getSellerStandardsProfile("CURRENT", "PROGRAM_US");
    test:assertTrue(response is StandardsProfile);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetTrafficReport() returns error? {
    Report response = check ebay->getTrafficReport(
        {}, {dimension: "DAY", metric: "LISTING_IMPRESSION_TOTAL", filter: "marketplace_ids:{EBAY_US},date_range:[20260901..20260930]"});
    test:assertTrue((response?.records ?: []).length() > 0);
}
