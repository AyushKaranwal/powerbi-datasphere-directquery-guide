let
    Host = "your-datasphere-host-url",

    Source = SapHana.Database(Host, [Implementation = "2.0"]),

    SqlText = "
    SELECT
        ""EMP"",
        ""EMP_NAME"",
        ""EMP_ID""
    FROM ""your_schema"".""your_view""
    (PLACEHOLDER.""$$YEAR$$"" => '" & Text.From(param_year) & "')
    ",

    Result = Value.NativeQuery(Source, SqlText, null, [EnableFolding = true])
in
    Result
