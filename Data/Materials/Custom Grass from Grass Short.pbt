Assets {
  Id: 16604324276055219496
  Name: "Custom Grass from Grass Short"
  PlatformAssetType: 13
  SerializationVersion: 107
  CustomMaterialAsset {
    BaseMaterialId: 18060507092995599839
    ParameterOverrides {
      Overrides {
        Name: "wind_speed"
        Float: 0.1
      }
      Overrides {
        Name: "wind_weight"
        Float: 0.1
      }
      Overrides {
        Name: "SSS"
        Color {
          R: 0.3
          G: 0.251133382
          B: 0.0454131067
          A: 1
        }
      }
      Overrides {
        Name: "color_roots"
        Color {
          R: 0.0309494771
          G: 0.0590000041
          B: 0.00422844896
          A: 1
        }
      }
      Overrides {
        Name: "color"
        Color {
          R: 0.0982119367
          G: 0.14
          B: 0.0172483586
          A: 1
        }
      }
    }
    Assets {
      Id: 18060507092995599839
      Name: "Grass (default)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_grass_dynamic_001_uv"
      }
    }
  }
}
