Assets {
  Id: 9248347207360543041
  Name: "Custom Grass from Grass Tall"
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
        Name: "color"
        Color {
          R: 0.0947043672
          G: 0.135
          B: 0.0166323464
          A: 1
        }
      }
      Overrides {
        Name: "color_roots"
        Color {
          R: 0.0529813059
          G: 0.101
          B: 0.00723853149
          A: 1
        }
      }
      Overrides {
        Name: "SSS"
        Color {
          R: 0.112
          G: 0.0937564597
          B: 0.0169542264
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
