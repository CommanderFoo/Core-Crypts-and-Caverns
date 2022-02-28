Assets {
  Id: 13265526455829556933
  Name: "Custom Flower from Flower Daisy Patch 01"
  PlatformAssetType: 13
  SerializationVersion: 107
  CustomMaterialAsset {
    BaseMaterialId: 4354231428136319462
    ParameterOverrides {
      Overrides {
        Name: "wind_speed"
        Float: 0.1
      }
      Overrides {
        Name: "wind_intensity"
        Float: 1
      }
      Overrides {
        Name: "wind_weight"
        Float: 0.1
      }
    }
    Assets {
      Id: 4354231428136319462
      Name: "Daisy (default)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_daisy_001_uv"
      }
    }
  }
}
