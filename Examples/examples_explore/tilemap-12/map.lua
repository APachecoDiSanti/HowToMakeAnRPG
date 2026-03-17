return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 8,
  height = 7,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "atlas",
      firstgid = 1,
      filename = "atlas.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 8,
      height = 7,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 2, 3, 4, 1, 5, 6,
        1, 1, 5, 6, 7, 1, 8, 9,
        3, 3, 11, 6, 7, 1, 1, 1,
        9, 10, 5, 6, 7, 1, 1, 1,
        1, 1, 5, 6, 7, 1, 2, 4,
        1, 1, 5, 6, 7, 1, 8, 10,
        1, 1, 8, 9, 10, 1, 1, 1
      }
    }
  }
}
