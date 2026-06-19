gEnemyDefs =
{
    goblin =
    {
        id = "goblin",
        stats =
        {
            ["hp_now"] = 1,
            ["hp_max"] = 1,
            ["mp_now"] = 0,
            ["mp_max"] = 0,
            ["strength"] = 8,
            ["speed"] = 5,
            ["intelligence"] = 2,
        },
        name = "Arena Goblin",
        actions = { "attack" },
        drop = {
            xp = 5,
            gold = {0, 5},
            always = {},
            chance = {
                {oddment = 95, item = {id = -1} },
                {oddment = 3, item = {id = 11} },
            }
        }
    }
}