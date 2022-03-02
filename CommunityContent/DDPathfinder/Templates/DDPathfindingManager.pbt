Assets {
  Id: 4897652334793759541
  Name: "DDPathfindingManager"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 17182930257740680113
      Objects {
        Id: 17182930257740680113
        Name: "DDPathfindingManager"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 5907375270724671462
        ChildIds: 5751837132543989306
        UnregisteredParameters {
          Overrides {
            Name: "cs:SaveDataFile"
            AssetReference {
              Id: 105595401518655734
            }
          }
          Overrides {
            Name: "cs:DefaultPathfinder"
            AssetReference {
              Id: 13504224978991329233
            }
          }
          Overrides {
            Name: "cs:DefaultPathSearchArea"
            String: "x=3 y=3 zMin=10 zMax=2"
          }
          Overrides {
            Name: "cs:RegisterInGlobals"
            Bool: true
          }
          Overrides {
            Name: "cs:MaxProcessingTimeEachFrame"
            Float: 0.05
          }
          Overrides {
            Name: "cs:FoliageNavMeshGenerationFix"
            Bool: false
          }
          Overrides {
            Name: "cs:Debug"
            Bool: false
          }
          Overrides {
            Name: "cs:VerboseDebug"
            Bool: false
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        NetworkContext {
          Type: Server
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5907375270724671462
        Name: "DDPathfinding_Readme"
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
        ParentId: 17182930257740680113
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 15892615431401768860
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 5751837132543989306
        Name: "DDPathfindingManager"
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
        ParentId: 17182930257740680113
        UnregisteredParameters {
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Script {
          ScriptAsset {
            Id: 15785362089074689480
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
    Description: " DDPathfinder is a generic all purpose pathfinding solution for core games.\r\n\r\nCurrent features:\r\n    - Works out of the box with NPC AI Kit by standardcombo.\r\n    - Automatically creates navmeshes that works for pretty much anything.\r\n    - Multiple pathfinding algorithms.\r\n    - Handles multiple navmeshes for different purposes (different unit sizes, locations etc.).\r\n\r\nMake sure you read the supplied DDPathfinding_Readme file before asking questions!\r\n\r\nReleases:\r\n\r\nv0.8.0\r\n    - LazyThetaStar has been fixed and is now the default pathfinding algorithm (2x speedup compared to ThetaStar)\r\n    - FitPathAgainstNavMeshZ path postprocessing have been improved, paths up and down slopes is now completely straight and follow ground a lot better\r\n    - Optimized CalcNavMeshGrid generation stage (1.3x speedup on demo map)\r\n    - Implemented workaround for the foliage collision problem (check out the property \"FoliageNavMeshGenerationFix\")\r\n    - FindPath works for both self and non-self calls\r\n    - Updated roadmap with more detail in regards to each future version\r\n\r\nv0.7.5\r\n    - Fixed path processing timer bug where it would deadlock (stop generating paths) if the path tasks took to long to spawn (reported by @Arrinity)\r\n\r\nv0.7.4\r\n    - Fixed bug where the top layer in each navmesh would always be culled (reported by @Arivenzys)\r\n    - Some minor optimization in navmesh generation and save string compression\r\n\r\nv0.7.3\r\n    - Added navmesh resolution into the navmesh picker priority\r\n    - Reverted change from v0.7.2 and did an better fix for the same problem (reported by @Elzean)\r\n    - Added readme text regarding how to work with multiple navmeshes\r\n\r\nv0.7.2\r\n    - Fixed error/bug where CalcNavGrid would offset raycast too much so it overlapped the above tile (reported by @slimychiken6969)\r\n\r\nv0.7.1\r\n    - Optimized CalcNavMeshGrid generation stage, is about 2x faster on the demo map\r\n    - Moved custom properties into template root (requested by @FearTheDev)\r\n    - Added additional documentation to readme\r\n\r\nv0.7.0\r\n    - Initial release"
  }
  SerializationVersion: 107
  DirectlyPublished: true
}
