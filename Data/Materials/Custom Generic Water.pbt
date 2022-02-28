Assets {
  Id: 7229116219297633787
  Name: "Custom Generic Water"
  PlatformAssetType: 13
  SerializationVersion: 107
  CustomMaterialAsset {
    BaseMaterialId: 16389858231077072708
    ParameterOverrides {
      Overrides {
        Name: "opacity distance"
        Float: 41.8611336
      }
      Overrides {
        Name: "opacity"
        Float: 1
      }
      Overrides {
        Name: "edge foam brightness"
        Float: 0.362219036
      }
      Overrides {
        Name: "object displacement amount"
        Float: 0.994277537
      }
      Overrides {
        Name: "wind speed"
        Float: 0.656602442
      }
      Overrides {
        Name: "flow direction"
        Vector {
          Y: 1
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
