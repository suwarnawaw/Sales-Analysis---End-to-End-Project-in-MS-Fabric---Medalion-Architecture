[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[BindToDefaultDestination = true]
shared Calender = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Calender", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
[BindToDefaultDestination = true]
shared CustomerData = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "CustomerData xlsx", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
[BindToDefaultDestination = true]
shared Product = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Product xlsx", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
[BindToDefaultDestination = true]
shared Sales = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Sales xlsx", ItemKind = "Table"]}[Data]
in
  #"Navigation 3";
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "805d8211-a74f-4297-8176-e7eb8b255851"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "dbo", ItemKind = "Schema"]}[Data]
in
  #"Navigation 3";
