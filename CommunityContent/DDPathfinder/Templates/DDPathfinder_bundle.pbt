Assets {
  Id: 17299132267675656466
  Name: "DDPathfinder"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 7047195345138391279
      Objects {
        Id: 7047195345138391279
        Name: "TemplateBundleDummy"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Folder {
          BundleDummy {
            ReferencedAssets {
              Id: 4897652334793759541
            }
            ReferencedAssets {
              Id: 14420555404588860362
            }
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Id: "992dcc9255874ff296430664afccdda8"
    OwnerAccountId: "428ca6144778493b90d03c2b1940ce81"
    OwnerName: "truedarkdev"
    Version: "1.5.0"
    Description: " DDPathfinder is a generic all purpose pathfinding solution for core games.\r\n\r\nCurrent features:\r\n    - Works out of the box with NPC AI Kit by standardcombo.\r\n    - Automatically creates navmeshes that works for pretty much anything.\r\n    - Multiple pathfinding algorithms.\r\n    - Handles multiple navmeshes for different purposes (different unit sizes, locations etc.).\r\n\r\nMake sure you read the supplied DDPathfinding_Readme file before asking questions!\r\n\r\nReleases:\r\n\r\nv0.8.0\r\n    - LazyThetaStar has been fixed and is now the default pathfinding algorithm (2x speedup compared to ThetaStar)\r\n    - FitPathAgainstNavMeshZ path postprocessing have been improved, paths up and down slopes is now completely straight and follow ground a lot better\r\n    - Optimized CalcNavMeshGrid generation stage (1.3x speedup on demo map)\r\n    - Implemented workaround for the foliage collision problem (check out the property \"FoliageNavMeshGenerationFix\")\r\n    - FindPath works for both self and non-self calls\r\n    - Updated roadmap with more detail in regards to each future version\r\n\r\nv0.7.5\r\n    - Fixed path processing timer bug where it would deadlock (stop generating paths) if the path tasks took to long to spawn (reported by @Arrinity)\r\n\r\nv0.7.4\r\n    - Fixed bug where the top layer in each navmesh would always be culled (reported by @Arivenzys)\r\n    - Some minor optimization in navmesh generation and save string compression\r\n\r\nv0.7.3\r\n    - Added navmesh resolution into the navmesh picker priority\r\n    - Reverted change from v0.7.2 and did an better fix for the same problem (reported by @Elzean)\r\n    - Added readme text regarding how to work with multiple navmeshes\r\n\r\nv0.7.2\r\n    - Fixed error/bug where CalcNavGrid would offset raycast too much so it overlapped the above tile (reported by @slimychiken6969)\r\n\r\nv0.7.1\r\n    - Optimized CalcNavMeshGrid generation stage, is about 2x faster on the demo map\r\n    - Moved custom properties into template root (requested by @FearTheDev)\r\n    - Added additional documentation to readme\r\n\r\nv0.7.0\r\n    - Initial release"
  }
  SerializationVersion: 107
}
