local LrDialogs = import 'LrDialogs'
local LrTasks = import 'LrTasks'
local LrApplication = import 'LrApplication'

LrTasks.startAsyncTask(function()
    -- Get the active catalog
    local catalog = LrApplication.activeCatalog()

    if not catalog then
        LrDialogs.message("Catalog Access Error", "Could not access the active catalog.")
        return
    end

    -- Get the photos currently in the grid view
    local photos = catalog:getTargetPhotos()

    if #photos == 0 then
        LrDialogs.message("No photos found", "There are no photos currently displayed in the grid view.")
        return
    end

    local filePath = LrDialogs.runSavePanel({
        title = "Save Filenames to Text File",
        requiredFileType = "txt",
    })

    if not filePath then
        return
    end

    local file = io.open(filePath, "w")

    for _, photo in ipairs(photos) do
        local filename = photo:getFormattedMetadata("fileName")
        file:write(filename .. "\n")
    end

    file:close()

    LrDialogs.message("Export complete", "Filenames have been saved to: " .. filePath)
end)

