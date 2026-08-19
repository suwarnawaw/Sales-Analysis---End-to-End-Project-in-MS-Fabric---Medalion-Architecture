[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[BindToDefaultDestination = true]
shared Sales = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "99671cec-d1d6-4607-8ae8-f631650da866"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 4" = #"Navigation 3"{[Name = "sales_data.xlsx"]}[Content],
  #"Imported Excel workbook" = Excel.Workbook(#"Navigation 4", null, true),
  Navigation = #"Imported Excel workbook"{[Item = "Sales", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(Navigation, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SaleID", Int64.Type}, {"CustomerID", Int64.Type}, {"ProductID", Int64.Type}, {"TotalAmount", type number}, {"SaleDate", type date}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared CustomerData = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "99671cec-d1d6-4607-8ae8-f631650da866"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 4" = #"Navigation 3"{[Name = "sales_data.xlsx"]}[Content],
  #"Imported Excel workbook" = Excel.Workbook(#"Navigation 4", null, true),
  Navigation = #"Imported Excel workbook"{[Item = "Customers", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(Navigation, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"CustomerID", Int64.Type}, {"CustomerName", type text}, {"Email", type text}, {"Phone", type text}, {"City", type text}})
in
  #"Changed column type";
[BindToDefaultDestination = true]
shared Product = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "99671cec-d1d6-4607-8ae8-f631650da866"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 4" = #"Navigation 3"{[Name = "sales_data.xlsx"]}[Content],
  #"Imported Excel workbook" = Excel.Workbook(#"Navigation 4", null, true),
  Navigation = #"Imported Excel workbook"{[Item = "Products", Kind = "Sheet"]}[Data],
  #"Promoted headers" = Table.PromoteHeaders(Navigation, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductID", Int64.Type}, {"ProductName", type text}, {"Category", type text}, {"Price", type number}})
in
  #"Changed column type";
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "."]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseName = "BronzeLayer_LH"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "dbo", ItemKind = "Schema"]}[Data]
in
  #"Navigation 3";
