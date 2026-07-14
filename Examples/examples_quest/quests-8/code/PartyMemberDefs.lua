gPartyMemberDefs =
{
    hero =
    {
        id = "hero",
        stats =
        {
            ["hp_now"] = 360,
            ["hp_max"] = 360,
            ["mp_now"] = 50,
            ["mp_max"] = 50,
            ["strength"] = 100,
            ["speed"] = 160,
            ["intelligence"] = 100,
        },
        actionGrowth =
        {
            [5] =
            {
                ['special'] = {'slash'},
            }
        },
        statGrowth =
        {
            ["hp_max"] = Dice:Create("2d25+25"),
            ["mp_max"] = Dice:Create("1d5+2"),
            ["strength"] = gStatGrowth.fast,
            ["speed"] = gStatGrowth.fast,
            ["intelligence"] = gStatGrowth.med,
        },
        portrait = "hero_portrait.png",
        name = "Seven",
        actions = { "attack", "item", "flee" },
        level = 10,
    },
    thief =
    {
        id = "thief",
        stats =
        {
            ["hp_now"] = 340,
            ["hp_max"] = 340,
            ["mp_now"] = 50,
            ["mp_max"] = 50,
            ["strength"] = 100,
            ["speed"] = 150,
            ["intelligence"] = 100,
        },
        statGrowth =
        {
            ["hp_max"] = Dice:Create("2d25+15"),
            ["mp_max"] = Dice:Create("2d10+5"),
            ["strength"] = gStatGrowth.med,
            ["speed"] = gStatGrowth.fast,
            ["intelligence"] = gStatGrowth.med,
        },
        actionGrowth =
        {
            [2] =
            {
                ['special'] = { 'steal' }
            }
        },
        portrait = "thief_portrait.png",
        name = "Jude",
        actions = { "attack", "item", "flee" },
        level = 10,
    },
    mage =
    {

        id = "mage",
        stats =
        {
            ["hp_now"] = 320,
            ["hp_max"] = 320,
            ["mp_now"] = 100,
            ["mp_max"] = 100,
            ["strength"] = 80,
            ["speed"] = 100,
            ["intelligence"] = 200,
        },
        statGrowth =
        {
            ["hp_max"] = Dice:Create("2d25+18"),
            ["mp_max"] = Dice:Create("1d5+2"),
            ["strength"] = gStatGrowth.med,
            ["speed"] = gStatGrowth.med,
            ["intelligence"] = gStatGrowth.fast,
        },
        actionGrowth =
        {
            [1] =
            {
                ['magic'] = { 'bolt' },
            },
            [2] =
            {
                ['magic'] = {'fire', 'ice'}
            },
            [4] =
            {
                ['magic'] = { 'burn' }
            }
        },
        portrait = "mage_portrait.png",
        name = "Ermis",
        actions = { "attack", "item", "flee"},
        magic = { },
        level = 10,
    },
}