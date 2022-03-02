Assets {
  Id: 9842710584401371534
  Name: "Wall - Pillar"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 1531286927984918526
      Objects {
        Id: 1531286927984918526
        Name: "Wall - Pillar"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 13990326784506496318
        ChildIds: 2148073242355887197
        ChildIds: 114892834013445316
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 13990326784506496318
        Name: "Wall"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1.00727522
          }
        }
        ParentId: 1531286927984918526
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 4948123311225573401
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:id"
            AssetReference {
              Id: 4948123311225573401
            }
          }
          Overrides {
            Name: "ma:Shared_Trim:id"
            AssetReference {
              Id: 4948123311225573401
            }
          }
          Overrides {
            Name: "ma:Shared_Trim:color"
            Color {
              R: 0.410000026
              G: 0.410000026
              B: 0.410000026
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_Detail1:color"
            Color {
              R: 0.410000026
              G: 0.410000026
              B: 0.410000026
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.410000026
              G: 0.410000026
              B: 0.410000026
              A: 1
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:smart"
            Bool: false
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:utile"
            Float: 4
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:vtile"
            Float: 4
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
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 6720504417188550187
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 2148073242355887197
        Name: "Torch"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1531286927984918526
        TemplateInstance {
          ParameterOverrideMap {
            key: 4802320173889178830
            value {
              Overrides {
                Name: "Name"
                String: "Torch"
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: -38.8776245
                  Y: -35.2245483
                }
              }
            }
          }
          TemplateAsset {
            Id: 7933574334353332278
          }
        }
      }
      Objects {
        Id: 114892834013445316
        Name: "Torch"
        Transform {
          Location {
            X: 540.702271
            Y: -118.12632
            Z: 2.28881836e-05
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1531286927984918526
        TemplateInstance {
          ParameterOverrideMap {
            key: 4802320173889178830
            value {
              Overrides {
                Name: "Name"
                String: "Torch"
              }
              Overrides {
                Name: "Scale"
                Vector {
                  X: 1
                  Y: 1
                  Z: 1
                }
              }
              Overrides {
                Name: "Position"
                Vector {
                  X: 37.2478638
                  Y: 36.1847229
                  Z: 3.81469727e-06
                }
              }
              Overrides {
                Name: "Rotation"
                Rotator {
                  Yaw: 180
                }
              }
            }
          }
          TemplateAsset {
            Id: 7933574334353332278
          }
        }
      }
    }
    Assets {
      Id: 6720504417188550187
      Name: "Column Segment 1m"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_column_segment_001"
      }
    }
    Assets {
      Id: 4948123311225573401
      Name: "Bricks Stone Floor Large 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_brick_stone_floor_large_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 107
}
