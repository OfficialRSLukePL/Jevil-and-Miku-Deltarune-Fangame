return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 18,
  properties = {
    ["light"] = true
  },
  tilesets = {
    {
      name = "finalkrisroomplsworkthistime",
      firstgid = 1,
      filename = "../tilesets/finalkrisroomplsworkthistime.tsx",
      exportfilename = "../tilesets/finalkrisroomplsworkthistime.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 1,
      name = "Warstwa Kafelków 1",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0, 0,
        0, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 0, 0,
        0, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 0, 0,
        0, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 0, 0,
        0, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 0, 0,
        0, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 0, 0,
        0, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 0, 0,
        0, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 0, 0,
        0, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 0, 0,
        0, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 15,
          name = "spawn",
          type = "",
          shape = "point",
          x = 322,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 555,
          y = 200,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 36,
          y = 200,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 366,
          y = 428.5,
          width = 234,
          height = 51.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 52,
          y = 428.5,
          width = 234,
          height = 51.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 559.667,
          height = 28.3333,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 11,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 480,
          width = 95.5,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room4",
            ["marker"] = "spawn"
          }
        },
        {
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 461,
          y = 230,
          width = 94,
          height = 112,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "krisroom.darkworld"
          }
        }
      }
    }
  }
}
