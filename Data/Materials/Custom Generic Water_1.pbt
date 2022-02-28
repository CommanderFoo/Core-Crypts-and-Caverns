Assets {
  Id: 492611928425301596
  Name: "Custom Generic Water_1"
  PlatformAssetType: 13
  SerializationVersion: 107
  CustomMaterialAsset {
    BaseMaterialId: 16389858231077072708
    ParameterOverrides {
      Overrides {
        Name: "flow direction"
        Vector {
          X: 1
          Y: 1
          Z: 0.2
        }
      }
    }
    Assets {
      Id: 16389858231077072708
      Name: "Generic Water"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxma_parameter_driven_water_manual"
      }
    }
  }
}
