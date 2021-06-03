components {
  id: "trail_maker"
  component: "/scenes/game/objects/player/trail_maker.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "trail_width"
    value: "35.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "points_count"
    value: "16.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "fade_tail_alpha"
    value: "10.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "trail_model_url"
    value: "#player_trail"
    type: PROPERTY_TYPE_URL
  }
}
embedded_components {
  id: "player_trail"
  type: "model"
  data: "mesh: \"/hyper_trails/models/trail_16.dae\"\n"
  "material: \"/assets/models/trail/trail.material\"\n"
  "textures: \"/hyper_trails/textures/data/texture0_1.png\"\n"
  "textures: \"/assets/textures/trail.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"unnamed\"\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
