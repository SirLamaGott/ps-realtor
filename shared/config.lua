Config = Config or {}

-- Set your Real Estate jobs here
Config.RealtorJobNames = { -- add multiple realestate jobs that are allowed to sell properties!
    'makler',
    'admin',
}

-- Set this value to true if you want to use the command to open the Housing Menu(Realtor Menu)
Config.UseCommand = true

--Set this value to FALSE if u DON'T want to play the tablet animation when using /housing or the usable item
Config.PlayAnimation = true

--Change this to whatever prop u want to use for the animation
Config.AnimationProp = 'prop_cs_tablet'

--Commisions is handled in ps-housing config.

Config.RealtorPerms = {
    manageProperty = 0, --minimum grade to manage property | default 1
    changePropertyForSale = 0, --minimum grade to list property | default 0
    sellProperty = 0, --minimum grade to sell property | default 0
    listNewProperty = 0, --minimum grade to list property | default 2
    deleteProperty = 0, --minimum grade to delete property | default 2
    setApartments = 0, --minimum grade to set apartments for players | default 2
}

RealtorJobs = {}

-- Convert config table to usable keys
for i = 1, #Config.RealtorJobNames do
    RealtorJobs[Config.RealtorJobNames[i]] = true
end
