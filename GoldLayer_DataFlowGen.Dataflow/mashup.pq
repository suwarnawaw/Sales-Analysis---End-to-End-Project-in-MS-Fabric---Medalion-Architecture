[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "805d8211-a74f-4297-8176-e7eb8b255851"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "dbo", ItemKind = "Schema"]}[Data]
in
  #"Navigation 3";
[BindToDefaultDestination = true]
shared calender = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "calender", ItemKind = "Table"]}[Data],
  #"Sorted rows" = Table.Sort(#"Navigation 2", {{"Date", Order.Ascending}}),
  #"Removed duplicates" = Table.Distinct(#"Sorted rows", {"Date"})
in
  #"Removed duplicates";
[BindToDefaultDestination = true]
shared customer = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "customer", ItemKind = "Table"]}[Data],
  #"Removed duplicates" = Table.Distinct(#"Navigation 2", {"CustomerName"})
in
  #"Removed duplicates";
[BindToDefaultDestination = true]
shared product = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "product", ItemKind = "Table"]}[Data],
  #"Removed duplicates" = Table.Distinct(#"Navigation 2", {"ProductName"})
in
  #"Removed duplicates";
[BindToDefaultDestination = true]
shared sales = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "sales", ItemKind = "Table"]}[Data],
  #"Sorted rows" = Table.Sort(#"Navigation 2", {{"SaleID", Order.Ascending}})
in
  #"Sorted rows";
