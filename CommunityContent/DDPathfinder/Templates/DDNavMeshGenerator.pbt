Assets {
  Id: 14420555404588860362
  Name: "DDNavMeshGenerator"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 10223134418665528892
      Objects {
        Id: 10223134418665528892
        Name: "DDNavMeshGenerator"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 15558715673223044782
        ChildIds: 4920491915511984392
        ChildIds: 12410953914868327895
        ChildIds: 15461767369106101966
        UnregisteredParameters {
          Overrides {
            Name: "cs:TileSize"
            Vector {
              X: 100
              Y: 100
              Z: 100
            }
          }
          Overrides {
            Name: "cs:MaxAllowedSlope"
            Float: 0.7
          }
          Overrides {
            Name: "cs:MaxUnitHeight"
            Float: 200
          }
          Overrides {
            Name: "cs:MaxUnitSizeRadius"
            Float: 50
          }
          Overrides {
            Name: "cs:EnableNavMesh"
            Bool: true
          }
          Overrides {
            Name: "cs:RemoveIslands"
            Bool: false
          }
          Overrides {
            Name: "cs:AutoStartNavMeshVisualization"
            Bool: false
          }
          Overrides {
            Name: "cs:FoliageNavMeshGenerationFix"
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
        Id: 15558715673223044782
        Name: "DDNavMeshGenerator"
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
        ParentId: 10223134418665528892
        UnregisteredParameters {
          Overrides {
            Name: "cs:NavMeshArea"
            ObjectReference {
              SubObjectId: 15461767369106101966
            }
          }
          Overrides {
            Name: "cs:IslandRemoverStartPos"
            ObjectReference {
              SubObjectId: 4920491915511984392
            }
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
        Script {
          ScriptAsset {
            Id: 5079309995629559626
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 4920491915511984392
        Name: "IslandRemoverStartPos"
        Transform {
          Location {
            X: -990
            Y: -770
            Z: -930
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 10223134418665528892
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceoff"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 1413196292823476264
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          DisableDistanceFieldLighting: true
          DisableCastShadows: true
          DisableReceiveDecals: true
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 12410953914868327895
        Name: "Visualizer"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 70
            Y: 70
            Z: 35
          }
        }
        ParentId: 10223134418665528892
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 12225777922476739267
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:forceoff"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        CoreMesh {
          MeshAsset {
            Id: 12095835209017042614
          }
          Teams {
          }
          DisableDistanceFieldLighting: true
          DisableCastShadows: true
          DisableReceiveDecals: true
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 15461767369106101966
        Name: "NavMeshArea"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 70
            Y: 70
            Z: 35
          }
        }
        ParentId: 10223134418665528892
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceon"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Trigger {
          TeamSettings {
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:box"
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 1413196292823476264
      Name: "Sphere"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_sphere_002"
      }
    }
    Assets {
      Id: 12095835209017042614
      Name: "Cube"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_002"
      }
    }
    Assets {
      Id: 12225777922476739267
      Name: "Grid Lines Emissive Double-Sided"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_grid_unlit_emissive_uv_doublesided"
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
