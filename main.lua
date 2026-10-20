--#region Atlases

SMODS.Atlas {
    key = 'placeholders',
    path = 'placeholders.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = '12b',
    path = '12b.png',
    px = 71,
    py = 95
}

--#endregion

--#region File Loading

local include_tutorial_jokers = false
local include_experimental = false


-- Jokers


local jokers_12b_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers_12b")
for _, file in ipairs(jokers_12b_src) do
    assert(SMODS.load_file("src/jokers_12b/" .. file))()
end


if include_tutorial_jokers then
    local jokers_tutorial_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers_tutorial")
    for _, file in ipairs(jokers_tutorial_src) do
        assert(SMODS.load_file("src/jokers_tutorial/" .. file))()
    end
end


-- End Jokers


-- Backs


local backs_regular_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs_regular")
for _, file in ipairs(backs_regular_src) do
    assert(SMODS.load_file("src/backs_regular/" .. file))()
end


if include_experimental then
    local backs_experimental_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs_experimental")
    for _, file in ipairs(backs_experimental_src) do
        assert(SMODS.load_file("src/backs_experimental/" .. file))()
    end
end


-- End Backs



--#endregion