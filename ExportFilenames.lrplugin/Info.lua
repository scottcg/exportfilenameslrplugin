return {
    LrSdkVersion = 11.0,
    LrSdkMinimumVersion = 6.0, -- Minimum Lightroom version
    LrToolkitIdentifier = 'com.github.exportfilenamesplugin',
    LrPluginName = 'Export Filenames',
    LrPluginInfoUrl = 'https://github.com/scottcg/exportfilenameslrplugin',

    LrExportMenuItems = {
        {
            title = 'Export Filenames to Text File',
            file = 'ExportFilenames.lua',
        },
    },

    VERSION = { major=1, minor=0, revision=0, build=1, },
}
