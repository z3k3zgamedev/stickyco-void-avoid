components {
  id: "tunnel"
  component: "/scenes/game/objects/tunnel/tunnel.model"
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
components {
  id: "ring"
  component: "/scenes/game/objects/tunnel/ring.model"
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
components {
  id: "script"
  component: "/scenes/game/objects/tunnel/tunnel.script"
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
    id: "width"
    value: "36.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "tunnel_texture"
    value: "/assets/textures/tunnel_blue.png"
    type: PROPERTY_TYPE_HASH
  }
}
