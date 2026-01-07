// Home Page and New Window
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.startup.page", 0);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.tabs.inTitlebar", 1);

// Ensure new tabs are also blank
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.url", "about:blank");

// Disable sponsored content on Firefox Home & Clear default topsites
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// Disable link pre-fetching / predicting what you'll click
user_pref("network.predictor.enabled", false);
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);

// Disable background telemetry and crash reporting
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("toolkit.telemetry.enabled", false);
