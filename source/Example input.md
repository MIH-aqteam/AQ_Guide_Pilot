Here are the examples

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
AUT_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
AUT_02 | AuthorityInstanceId | DU | varchar(50) | string | ✓ | 
AUT_03 | AuthorityRole | 1 | varchar(50) | string | ✓ | ✓
AUT_04 | Email | eve.bot@dema.dus | varchar(50) | string | ✓ | 
AUT_05 | AuthorityInstance | nuts0 | varchar(20) | string |  | ✓
AUT_06 | AuthorityName | Dustovia Environmental Agency (DEA) – Air Quality Division | varchar(150) | string |  | 
AUT_07 | AuthorityURL | www.dea.dustovia.dus | varchar(150) | string |  | 
AUT_08 | AuthorityAddress | 42 CleanAir St, Terminalgrad, Dustovia (DUS-4242) | varchar(150) | string |  | 
AUT_09 | PersonName | E.V.E. Bot | varchar(150) | string |  | 
AUT_10 | AuthorityStatus | active | varchar(10) | string |  | ✓

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
STA_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
STA_02 | StationEoICode | DU0001 | varchar(10) | string | ✓ | 
STA_03 | NetworkId | NET_DU01 | varchar(50) | string |  | 
STA_04 | NetworkName | Dustovia Capital | varchar(150) | string |  | 
STA_05 | NetworkOrganisationalLevel | regional | varchar(20) | string |  | ✓
STA_06 | Timezone | UTC-1 | varchar(20) | string |  | ✓
STA_07 | StationNationalCode | DU01_01 | varchar(50) | string |  | 
STA_08 | StationName | Rivny-Suburb-A | varchar(50) | string |  | 
STA_09 | NetworkDocumentId | DOC_NET_DU01 | varchar(150) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SPO_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SPO_02 | AssessmentMethodId | SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
SPO_03 | SamplingPointReferenceId | SPOref_DU0001_0005_1 | varchar(32) | string |  | 
SPO_04 | PollutantId | 5 | int | numeric |  | ✓
SPO_05 | StationEoICode | DU0001 | varchar(10) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SPL_01 | CountryCode | DU | varchar(2) | string | ✓ | 
SPL_02 | AssessmentMethodId | SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
SPL_03 | LocationBegin | 25/06/2013 00:00 | datetime | datetime | ✓ | 
SPL_04 | LocationEnd | null | datetime | datetime |  | 
SPL_05 | StationArea | urban | varchar(100) | string |  | ✓
SPL_06 | SamplingPointCategory | background | varchar(50) | string |  | ✓
SPL_07 | Hotspot | N | bit | boolean |  | 
SPL_08 | Supersite | N | bit | boolean |  | 
SPL_09 | Latitude | 43.60625 | decimal(8,4) | numeric |  | 
SPL_10 | Longitude | 33.093242 | decimal(8,4) | numeric |  | 
SPL_11 | Altitude | 21 | decimal(10,1) | numeric |  | 
SPL_12 | InletHeight | 2 | decimal(10,1) | numeric |  | 
SPL_13 | BuildingDistance | 10 | decimal(10,1) | numeric |  | 
SPL_14 | KerbDistance | 5 | decimal(10,1) | numeric |  | 
SPL_15 | EmissionSourceDistance | 5 | decimal(10,1) | numeric |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SPP_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SPP_02 | ProcessId | SPP_DU0001_0005_1 | varchar(150) | string | ✓ | 
SPP_03 | AssessmentMethodId | SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
SPP_04 | ProcessActivityBegin | 25/06/2013 00:00 | datetime | datetime | ✓ | 
SPP_05 | ProcessActivityEnd | null | datetime | datetime |  | 
SPP_06 | PollutantId | 5 | int | numeric |  | ✓
SPP_07 | MeasurementType | automatic | varchar(50) | string |  | ✓
SPP_08 | Method | BETA | varchar(50) | string |  | ✓
SPP_09 | Equipment | BETA1020 | varchar(50) | string |  | ✓
SPP_10 | AnalyticalTechnique | null | varchar(50) | string |  | ✓
SPP_11 | EquivalenceDemonstrated | yes | varchar(50) | string |  | ✓
SPP_12 | DataQualityDocumentId | DOC_DQ_SPP_DU0005_1 | varchar(150) | string |  | 
SPP_13 | EquivalenceDemonstrationDocumentId | DOC_EQ_SPP_DU0005_1 | varchar(150) | string |  | 
SPP_14 | ProcessDocumentId | DOC_PR_SPP_DU0005_1 | varchar(150) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
MOE_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
MOE_02 | AssessmentMethodId | MOD_DU_NO2 | varchar(50) | string | ✓ | 
MOE_03 | DataAggregationProcessId | P1Y | varchar(50) | string | ✓ | ✓
MOE_04 | AssessmentMethodName | null | varchar(150) | string |  | 
MOE_05 | PollutantId | 8 | int | numeric |  | ✓
MOE_06 | ResultEncoding | external | varchar(10) | string |  | ✓
MOE_07 | MethodApplication | assessment | varchar(20) | string |  | ✓
MOE_08 | GenericMQI | 0.8 | decimal(5,2) | numeric |  | 
MOE_09 | DataQualityDocumentId | DOC_MOD_DQ_MOD_DU_NO2 | varchar(150) | string |  | 
MOE_10 | MethodDocumentId | DOC_MOD_MR_MOD_DU_NO2 | varchar(150) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
OMR_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
OMR_02 | AssessmentMethodId | SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
OMR_03 | Start | 2024-01-01 00:00:00 | datetime | datetime | ✓ | 
OMR_04 | PollutantId | 5 | int | numeric |  | ✓
OMR_05 | End | 2024-01-01 01:00:00 | datetime | datetime |  | 
OMR_06 | Value | 16.4 | decimal(10,2) | numeric |  | 
OMR_07 | Unit | ug/m3 | varchar(10) | string |  | ✓
OMR_08 | Validity | 1 | int | numeric |  | ✓
OMR_09 | Verification | 1 | int | numeric |  | ✓
OMR_10 | DataCapture |  | decimal(5,2) | numeric |  | 
OMR_11 | TimeResolution | hour | varchar(10) | string |  | ✓
OMR_12 | ResultTime | 2025-09-28 16:12:36 | datetime | datetime |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
MRI_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
MRI_02 | AssessmentMethodId | OBE_DU_SEASALT_PM10_H_LV_ADJ | varchar(50) | string | ✓ | 
MRI_03 | Start | 2024-01-01 00:00:00 | datetime | datetime | ✓ | 
MRI_04 | DataAggregationProcessId | P1D | varchar(50) | string | ✓ | ✓
MRI_05 | X | 3463000 | bigint | numeric | ✓ | 
MRI_06 | Y | 2245000 | bigint | numeric | ✓ | 
MRI_07 | PollutantId | 5 | int | numeric |  | ✓
MRI_08 | End | 2024-01-02 00:00:00 | datetime | datetime |  | 
MRI_09 | Value | 1 | decimal(10,2) | numeric |  | 
MRI_10 | Unit | ug/m3 | varchar(10) | string |  | ✓
MRI_11 | Validity | 1 | int | numeric |  | ✓
MRI_12 | SpatialResolution | 1000 | int | numeric |  | ✓
MRI_13 | ResultTime | 2025-09-14 10:19:44 | datetime | datetime |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
MRE_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
MRE_02 | AssessmentMethodId | MOD_DU_PM10_NAT_SR | varchar(50) | string | ✓ | 
MRE_03 | Start | 2021-01-01 00:00:00 | datetime | datetime | ✓ | 
MRE_04 | DataAggregationProcessId | P1Y | varchar(50) | string | ✓ | ✓
MRE_05 | PollutantId | 5 | int | numeric |  | ✓
MRE_06 | End | 2022-01-01 00:00:00 | datetime | datetime |  | 
MRE_07 | Unit | ug/m3 | varchar(10) | string |  | ✓
MRE_08 | Validity | 1 | int | numeric |  | ✓
MRE_09 | SpatialResolution | 1000 | int | numeric |  | ✓
MRE_10 | ResultTime | 2023-04-14 10:19:44 | datetime | datetime |  | 
MRE_11 | GeoTiffAttachment |  | varchar(100) | attachment (R3 data type) |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
ZGE_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
ZGE_02 | ZoneId | ZON_DU000A | varchar(20) | string | ✓ | 
ZGE_03 | ZoneGeometryGeoJson | {"type":"Feature","geometry":{"type":"MultiPolygon","coordinates":[[[[4.419074,51.3040095],[4.4181004999999995,51.305457],...,[4.3362534,51.1730749],[4.3367638,51.1732234]]]]},"properties":{"srid":"4326"}} | varbinary | geometry |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
ARZ_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
ARZ_02 | AssessmentRegimeId | ARE_ZON_DU000A_0005_LV_H_aMean_2021_1 | varchar(50) | string | ✓ | 
ARZ_03 | ZoneId | ZON_DU000A | varchar(50) | string |  | 
ARZ_04 | ZoneNationalCode | DU000A | varchar(50) | string |  | 
ARZ_05 | ZoneArea | 442.31 | decimal(10,2) | numeric |  | 
ARZ_06 | ZoneCategory | zone | varchar(20) | string |  | ✓
ARZ_07 | ZoneType | agg | varchar(20) | string |  | ✓
ARZ_08 | ZoneName | EcoDome Heights | varchar(150) | string |  | 
ARZ_09 | PollutantId | 5 | int | numeric |  | ✓
ARZ_10 | ProtectionTarget | H | varchar(50) | string |  | ✓
ARZ_11 | ObjectiveType | LV | varchar(50) | string |  | ✓
ARZ_12 | ReportingMetric | aMean | varchar(50) | string |  | ✓
ARZ_13 | AssessmentThresholdExceedance | aboveUAT | varchar(20) | string |  | ✓
ARZ_14 | PostponementYear | null | int | numeric |  | 
ARZ_15 | FixedMeasurementReduction | N | bit | boolean |  | 
ARZ_16 | ZoneResidentPopulationYear | 2020 | int | numeric |  | 
ARZ_17 | ZoneResidentPopulation | 599159 | int | numeric |  | 
ARZ_18 | ClassificationYear | 2021 | int | numeric |  | 
ARZ_19 | ClassificationDocumentId | DOC_ARE_ZON_DU_2021 | varchar(150) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
CAM_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
CAM_02 | ReportingYear | 2024 | int | numeric | ✓ | 
CAM_03 | AssessmentRegimeId | ARE_ZON_DU000A_0005_LV_H_aMean_2021_1 | varchar(50) | string | ✓ | 
CAM_04 | DataAggregationProcessId | P1Y | varchar(50) | string | ✓ | ✓
CAM_05 | AssessmentMethodId | SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
CAM_06 | PollutantId | 5 | int | numeric |  | ✓
CAM_07 | AssessmentType | fixed | varchar(50) | string |  | ✓
CAM_08 | IsExceedance | FALSE | varchar(5) | string |  | 
CAM_09 | DataCoverage | 85.78 | decimal(5,2) | numeric |  | 
CAM_10 | PollutionLevel | 21 | decimal(10,3) | numeric |  | 
CAM_11 | PollutionLevelAdjusted | null | decimal(10,3) | numeric |  | 
CAM_12 | RelativeUncertaintyLimit | 0.2 | decimal(10,2) | numeric |  | 
CAM_13 | AssessmentMQI | null | decimal(5,2) | numeric |  | 
CAM_14 | CorrectionFlag | Y | bit | boolean |  | 
CAM_15 | AttainmentId | ATT_ZON_DU000A_00005_LV_H_aMean_2024_1 | varchar(50) | string |  | 
CAM_16 | SRSId | SRS_ZON_DU000A_00005_1 | varchar(50) | string |  | 
CAM_17 | PreliminaryReason | null | varchar(50) | string |  | ✓
CAM_18 | Deletion | 0 | bit | boolean |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SRS_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SRS_02 | SRSId | SRS_ZON_DU000A_00005_1 | varchar(50) | string | ✓ | 
SRS_03 | SRSApplicationId | SRS_SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
SRS_04 | SRSApplication | spo_sr | varchar(50) | string |  | ✓
SRS_05 | ResultEncoding | inline | varchar(10) | string |  | ✓
SRS_06 | RepresentativenessAssessmentMethodId | MOD_DU_PM10_NAT_SR | varchar(50) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SRI_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SRI_02 | SRSApplicationId | SRS_SPO_DU0001_0005_100 | varchar(50) | string | ✓ | 
SRI_03 | X | 3825000 | bigint | numeric | ✓ | 
SRI_04 | Y | 2274000 | bigint | numeric | ✓ | 
SRI_05 | SpatialResolution | 1000 | int | numeric |  | ✓

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SRE_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SRE_02 | SRSApplicationId | SRS_SPO_DU0001_0008_100 | varchar(50) | string | ✓ | 
SRE_03 | SpatialResolution | 100 | int | numeric |  | ✓
SRE_04 | GeoTiffAttachment |  | varchar(100) | attachment (R3 data type) |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
ADJ_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
ADJ_02 | AttainmentId | ATT_ZON_DU000B_00005_LV_H_aMean_2024_1 | varchar(50) | string | ✓ | 
ADJ_03 | AdjustmentSource | H | varchar(50) | string | ✓ | ✓
ADJ_04 | AdjustmentAssessmentMethodId | OBE_DU_SEASALT_PM10_H_LV_ADJ | varchar(10) | string |  | 
ADJ_05 | AdjustmentDocumentId | null |  |  |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
CPL_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
CPL_02 | AttainmentId | ATT_ZON_DU000B_00005_LV_H_daysAbove_2024_1 | varchar(50) | string | ✓ | 
CPL_03 | PlanId | PLA_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
CPL_04 | ScenarioId | SCE_ZON_DU000B_00005_LV_H_daysAbove_1 | varchar(50) | string | ✓ | 
CPL_05 | SourceApportionmentId | SAP_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
CPL_06 | PlanCategory | plan | varchar(20) | string |  | ✓
CPL_07 | PlanTitle | აირე კალიტატე პროგрама გენერალა, კლიმა ბაბეს ე ემისა ულიე პლანა პორ ურბა-იუგ დუსტოვა რეჟიონ, მე ვეპრიმ პლანა, ტრეგუეს ე ნდიეკიე მეხანიზამ 2028–2035 | nvarchar(1000) | string |  | 
CPL_08 | PlanAdoptionDate | 2025-11-28 | date | datetime |  | 
CPL_09 | PlanBeginDate | 2026-01-01 | date | datetime |  | 
CPL_10 | PlanEndDate | 2030-12-31 | date | datetime |  | 
CPL_11 | PlanDocumentId | DOC_ZON_DU000B_00005_LV_H_daysAbove | varchar(150) | string |  | 
CPL_12 | Deletion | 0 | bit | boolean |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
PSC_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
PSC_02 | PlanId | PLA_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
PSC_03 | ScenarioId | SCE_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
PSC_04 | ScenarioCategory | reference | varchar(20) | string | ✓ | ✓
PSC_05 | ScenarioNationalCode | PLA_another_scenario | varchar(50) | string |  | 
PSC_06 | PollutantId | 5 | int | numeric |  | ✓
PSC_07 | DataAggregationProcessId | P1Y-daysAbove50 | varchar(50) | string |  | ✓
PSC_08 | ScenarioYear | 2024 | int | numeric |  | 
PSC_09 | ScenarioPollutionLevel | 43 | decimal(10,2) | numeric |  | 
PSC_10 | ExposedPopulation | 95250 | int | numeric |  | 
PSC_11 | ScenarioAssessmentMethodId | MOD_DU_PM10_LOC_SCEN_REF | varchar(50) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SAP_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SAP_02 | SourceApportionmentId | SAP_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
SAP_03 | ContributionType | background | varchar(20) | string | ✓ | ✓
SAP_04 | SpatialScale | regional | varchar(50) | string | ✓ | ✓
SAP_05 | SourceSector | other | varchar(50) | string | ✓ | ✓
SAP_06 | PollutantId | 5 | int | numeric |  | ✓
SAP_07 | Contribution | 9 | decimal(8,2) | numeric |  | 
SAP_08 | SourceApportionmentDocumentId | DOC_SAP_ZON_DU000B_00005_LV_H_daysAbove | varchar(150) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
SME_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
SME_02 | ScenarioId | SCE_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
SME_03 | ScenarioCategory | baseline | varchar(20) | string | ✓ | ✓
SME_04 | MeasureGroupId | MG1_SCE_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
SME_05 | MeasureGroupPollutionReduction | null | decimal(10,2) | numeric |  | 
SME_06 | MeasureReductionAssessmentMethodId | null | varchar(50) | string |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
MEA_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
MEA_02 | MeasureGroupId | MG1_SCE_ZON_DU000B_00005_LV_H_daysAbove | varchar(50) | string | ✓ | 
MEA_03 | MeasureId | Measure_1256 | varchar(50) | string | ✓ | 
MEA_04 | MeasureNationalCode | Measure_1256 | varchar(50) | string |  | 
MEA_05 | MeasureName | Industrial Emission Control | varchar(150) | string |  | 
MEA_06 | MeasureClassification | emissioncontrol | varchar(50) | string |  | ✓
MEA_07 | MeasureType | outside | varchar(50) | string |  | ✓
MEA_08 | SourceSector | industry | varchar(50) | string |  | ✓
MEA_09 | SpatialScale | local | varchar(50) | string |  | ✓
MEA_10 | ImplementationBegin | 01-02-2025 | date | datetime |  | 
MEA_11 | ImplementationEnd | 31-12-2027 | date | datetime |  | 
MEA_12 | MeasureCost | null | decimal(18,2) | numeric |  | 
MEA_13 | FullEffectDate | null | date | datetime |  | 
MEA_14 | MeasureStatus | implementation | varchar(50) | string |  | ✓
MEA_15 | ReasonIfMeasureNotUsed | null | varchar(50) | string |  | ✓
MEA_16 | Deletion | 0 | bit | boolean |  | 

| Attribute Code | Attribute Name | Example | SQL DB Data Type | ReportNet3 Data Type | PK | CL |
| --- | --- | --- | --- | --- | --- | --- |
DOC_01 | CountryCode | DU | varchar(2) | string | ✓ | ✓
DOC_02 | DataTable | Station | varchar(50) | string | ✓ | ✓
DOC_03 | DocumentType | NetworkDocument | varchar(50) | string | ✓ | ✓
DOC_04 | DocumentId | DOC_NET_DU01 | varchar(500) | string | ✓ | 
DOC_05 | DocumentAttachment | DUS_NET_DU01.pdf | varchar(100) | attachment (R3 data type) |  | 
DOC_06 | DocumentOriginalURL | www.dea.dustovia.dus/AQeREP/NET/DU01.pdf | varchar(100) | string |  | 