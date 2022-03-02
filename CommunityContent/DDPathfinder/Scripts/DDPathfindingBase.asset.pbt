Assets {
  Id: 1914825646140977013
  Name: "DDPathfindingBase"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:MergePathsWithSameDirection"
        Bool: false
      }
      Overrides {
        Name: "cs:FitPathAgainstNavMeshZ"
        Bool: true
      }
      Overrides {
        Name: "cs:MaxPathSearchTime"
        Float: 0.5
      }
      Overrides {
        Name: "cs:DDPerfTimer"
        AssetReference {
          Id: 4912789435793005038
        }
      }
      Overrides {
        Name: "cs:DDPromise"
        AssetReference {
          Id: 12296147671636359861
        }
      }
    }
  }
  SerializationVersion: 107
}
