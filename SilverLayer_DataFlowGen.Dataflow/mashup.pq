[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[BindToDefaultDestination = true]
shared calender = let
    // Define the start and end dates for the calendar
    StartDate = #date(2024, 1, 1),
    EndDate = #date(2024, 12, 31),
    
    // Create a list of dates between start and end dates
    DateList = List.Dates(StartDate, Duration.Days(EndDate - StartDate) + 1, #duration(1, 0, 0, 0)),
    
    // Convert the list to a table
    DateTable = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}),

    // Add useful columns
    AddYear = Table.AddColumn(DateTable, "Year", each Date.Year([Date]), Int64.Type),
    AddMonth = Table.AddColumn(AddYear, "Month", each Date.Month([Date]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonth, "Month Name", each Date.ToText([Date], "MMMM"), type text),
    AddMonthShort = Table.AddColumn(AddMonthName, "Month Short", each Date.ToText([Date], "MMM"), type text),
    AddQuarter = Table.AddColumn(AddMonthShort, "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddDay = Table.AddColumn(AddQuarter, "Day", each Date.Day([Date]), Int64.Type),
    AddDayOfWeek = Table.AddColumn(AddDay, "Day of Week", each Date.DayOfWeek([Date]), Int64.Type),
    AddDayName = Table.AddColumn(AddDayOfWeek, "Day Name", each Date.ToText([Date], "dddd"), type text),
    AddWeekOfYear = Table.AddColumn(AddDayName, "Week of Year", each Date.WeekOfYear([Date]), Int64.Type),
    AddIsWeekend = Table.AddColumn(AddWeekOfYear, "Is Weekend", each if Date.DayOfWeek([Date]) >= 5 then true else false, type logical),
  #"Changed column type" = Table.TransformColumnTypes(AddIsWeekend, {{"Date", type date}}),
  #"Removed duplicates" = Table.Distinct(#"Changed column type", {"Date"})
in
    #"Removed duplicates";
shared DefaultDestination = let
  Source = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  #"Navigation 1" = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "77be5bec-5848-4c15-9430-5463e43aa1ea"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "dbo", ItemKind = "Schema"]}[Data]
in
  #"Navigation 3";
[BindToDefaultDestination = true]
shared customer = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "99671cec-d1d6-4607-8ae8-f631650da866"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "customer", ItemKind = "Table"]}[Data],
  #"Removed duplicates" = Table.Distinct(#"Navigation 2", {"CustomerName"})
in
  #"Removed duplicates";
[BindToDefaultDestination = true]
shared product = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "99671cec-d1d6-4607-8ae8-f631650da866"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "product", ItemKind = "Table"]}[Data],
  #"Removed duplicates" = Table.Distinct(#"Navigation 2", {"ProductName"})
in
  #"Removed duplicates";
[BindToDefaultDestination = true]
shared sales = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "35420ad7-1cd7-4ba0-aeb0-40a5bab22070"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "99671cec-d1d6-4607-8ae8-f631650da866"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "sales", ItemKind = "Table"]}[Data],
  #"Sorted rows" = Table.Sort(#"Navigation 2", {{"SaleID", Order.Ascending}})
in
  #"Sorted rows";
