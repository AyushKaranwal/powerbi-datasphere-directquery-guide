## ❗ Problem Statement

Power BI does not natively support dynamic input parameter passing to SAP Datasphere views using DirectQuery.

## ✅ Solution

Implemented custom parameter binding using HANA placeholder syntax within NativeQuery:

PLACEHOLDER."$$MONTH$$" => 'value'

This enables dynamic filtering without modifying the underlying Datasphere view.

## 🎯 Impact

- Enabled dynamic reporting based on runtime input
- Avoided duplication of Datasphere views
- Maintained query folding for performance


## 🔍 Before vs After

### ❌ Before
- Static queries
- No dynamic filtering
- Required multiple views

### ✅ After
- Dynamic parameterized queries
- Single reusable Datasphere view
- Runtime filtering from Power BI

## ⚙️ How to Run

1. Open Power BI
2. Connect to SAP Datasphere via SAP HANA connector
3. Open Advanced Editor
4. Paste M query from `queries/datasphere_query.pq`
5. Update parameter value
6. Run query


## ⚠️ Challenges & Learnings

- Placeholder syntax must match exact parameter name in Datasphere
- Values must be passed as string literals ('value')
- Query folding breaks if syntax is incorrect
- NativeQuery requires careful string handling


# powerbi-datasphere-directquery-guide
Implementation guide and lessons learned for integrating SAP Datasphere Prompt Views with Power BI DirectQuery.

# Power BI DirectQuery with SAP Datasphere Prompt Views

## Overview

This repository documents my learnings while integrating SAP Datasphere Prompt Views (input parameter-based views) with Power BI DirectQuery.

## Topics Covered

- Architecture
- Connectivity
- Parameter Handling
- Performance Considerations
- Lessons Learned

## Architecture

SAP Source Systems
↓
SAP Datasphere
↓
Prompt Views
↓
Power BI DirectQuery
↓
Business Users


## Disclaimer

All examples are generic and do not contain any client-specific information.
