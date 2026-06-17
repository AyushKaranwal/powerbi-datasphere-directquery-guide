let
    Host = "your-datasphere-host-url",

    Source = SapHana.Database(Host, [Implementation = "2.0"]),

    SqlText = "
    SELECT
        ""EMP"",
        ""EMP_NAME"",
        ""EMP_ID""
    FROM ""your_schema"".""your_view""
    (PLACEHOLDER.""$$MONTH$$"" => '" & Text.From(param_month) & "')
    ",

    Result = Value.NativeQuery(Source, SqlText, null, [EnableFolding = true])
in
    Result
