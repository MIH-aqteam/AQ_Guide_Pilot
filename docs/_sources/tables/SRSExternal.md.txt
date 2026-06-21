# SRSExternal

```{contents}
:local:
:depth: 2
```

## Description

The purpose of the SRSExternal table is to collect the representativeness area (either SPO representativeness or exceedance extent) as external GIS files, for each sampling point declared for compliance assessments.

Attributes which create unique identifier of each record: CountryCode and SRSApplicationId.

Updates of the SRSExternal table will not be time stamped - i.e. each update generates the only version of the table in reference/legacy data.
Validity of the modifications of existing record and/or new record will be tested using QC (rules to be established).

Data products for public will present the records validated at the latest deadline.
Data products for reporters will present the records as reported the most recently.

## EEA extensions

Reference data flow will have two tables representing reporting of SR areas:
- SRSInventory;
- SRSGrid.
SRSInventory will collect information about count of values reported for each SR area and will contain a reference to raw data file.
SRSGrid table will differ from the reporting data flow however it will contain gridded AQ values in 3 layers:
- 2 Very High Resolution layers (10 and 100m - depending on original resolutions) for populated areas and traffic links;
- 1 High Resolution layer (1000m) for all areas.

SRSGrid table will be extended by several attributes:
- Country (for convenience), based on ISO2 country codes;
- Grid number identifiers, based on X,Y (SRID 3035).

## Data management rules

It is expected that SR areas for sampling points declared for compliance assessments will be reported together with attainment reports (when ComplianceAssessmentMethod table is reported).

Exceedance extents are expected to be reported as soon as relevant air quality plans are in place.

Records in SRSExternal table which do not have any correspondence to records in SpatialRepresentativeness table will be flagged for deletion in the reference data flow.

## Attributes

| Attribute Code | Attribute Name | SQL DB Data Type | ReportNet3 Data Type | Properties | Code list | Related table(s) |
|---|---|---|---|---|---|---|
| SRE_01 | CountryCode | varchar(2) | string | PK | [countries](https://dd.eionet.europa.eu/vocabulary/common/countries) |  |
| SRE_02 | SRSApplicationId | varchar(50) | string | PK |  | [SpatialRepresentativeness](SpatialRepresentativeness.md) |
| SRE_03 | SpatialResolution | int | numeric |  | [spatialresolution](https://dd.eionet.europa.eu/vocabulary/aq/spatialresolution) |  |
| SRE_04 | GeoTiffAttachment | varchar(100) | attachment (R3 data type) |  |  |  |

## Attribute details

### SRE_01 – CountryCode

**Content**

Country or territory ISO2 code.

### SRE_02 – SRSApplicationId

**Content**

Identifier of the specific spatial representativeness given by data provider.

### SRE_03 – SpatialResolution

**Content**

Description of the spatial resolution of the data, indicating the level of detail.

**Remarks**

SpatialResolution will be tested against the code list for allowed values.

### SRE_04 – GISAttachment

**Content**

Attached GIS file containing the spatial representativeness area.

**Remarks**

The attachment contains either:
- sampling point representativeness area; or
- exceedance extent area.

## Example

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SRE_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SRE_02 | SRSApplicationId | SRS_SPO_DU0001_0008_100 | varchar(50) | string | ✓ | 
SRE_03 | SpatialResolution | 100 | int | numeric |  | ✓
SRE_04 | GeoTiffAttachment |  | varchar(100) | attachment (R3 data type) |  | 

**Legend:** PK = Primary Key; CL = Code List.

The complete set of examples is available in the Excel workbook, worksheet `SRSExternal`.

[Download complete examples workbook](../_static/R3_v501_AQ_Reporting_guide_example.xlsx)
