// Allow declaratively installed extensions to enable themselves
user_pref("extensions.autoDisableScopes", 0);

// Hide bookmarks toolbar
user_pref("browser.toolbars.bookmarks.visibility", "never");

// Hide tab groups
user_pref("browser.tabs.groups.enabled", false);

// Simplify new tab page
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);

// Vertical tabs
user_pref("sidebar.verticalTabs", true);
user_pref("sidebar.visibility", "always");
user_pref("sidebar.revamp", true);
user_pref("browser.tabs.inTitlebar", 1);

// DuckDuckGo search
user_pref("browser.search.defaultenginename", "ddg");

// Customization State
user_pref("browser.uiCustomization.state",
  "{\"placements\":{\"widget-overflow-fixed-list\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"urlbar-container\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[],\"PersonalToolbar\":[]},\"seen\":[],\"dirtyAreaCache\":[\"nav-bar\",\"TabsToolbar\",\"PersonalToolbar\"],\"currentVersion\":20,\"newElementCount\":0}"
);
