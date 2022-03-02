Assets {
  Id: 13161498840898117721
  Name: "Custom Emissive Glow Transparent"
  PlatformAssetType: 13
  SerializationVersion: 107
  CustomMaterialAsset {
    BaseMaterialId: 7579850640650293260
    ParameterOverrides {
      Overrides {
        Name: "emissive_boost"
        Float: 0
      }
      Overrides {
        Name: "color"
        Color {
          R: 1
          B: 0.005
          A: 1
        }
      }
    }
    Assets {
      Id: 7579850640650293260
      Name: "Emissive Glow Transparent"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_emissive_001"
      }
    }
  }
}
