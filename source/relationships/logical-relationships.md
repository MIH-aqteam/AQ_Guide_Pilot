# Logical Relationships

````{dropdown} Authority → Multiple Entity Tables

**Relationship**

`Authority.AuthorityInstanceId` can identify different types of reporting entities.

Depending on the value of `AuthorityInstance`, or an equivalent type attribute, it may refer to:

- `MeasurementStation.StationEoICode`
- `SamplingPoint.AssessmentMethodId`
- `AssessmentRegimeZone.ZoneId`
- `ZoneGeometry.ZoneId`
- `ModelObjectiveEstimation.AssessmentMethodId`

or to a national level if `AuthorityInstance = 'nuts0'`.

**Why No Physical FK Can Be Defined**

The target parent table depends on another attribute.

A single SQL foreign key cannot conditionally reference different parent tables.

Creating several foreign keys would incorrectly require the same identifier to exist in **all** possible parent tables.

This is therefore a **polymorphic logical relationship**.

````

````{dropdown} SamplingPointLocation ↔ ObservationMeasurementResult

**Relationship**

An observation must correspond to a valid sampling-point location for the observation time.

The matching logic uses:

- same `CountryCode`
- same `AssessmentMethodId`
- `Observation.Start >= LocationBegin`
- `Observation.Start < LocationEnd`

or:

- `LocationEnd` is `NULL`

**Why No Physical FK Can Be Defined**

The relationship depends on the observation timestamp falling within a validity interval.

`ObservationMeasurementResult` does not contain `LocationBegin`, which forms part of the `SamplingPointLocation` primary key.

It therefore does not directly identify one specific location record.

This is a **temporal logical relationship**.

````

````{dropdown} SamplingProcess ↔ ObservationMeasurementResult

**Relationship**

An observation must correspond to an active sampling process for the same sampling point.

The matching logic uses:

- same `CountryCode`
- same `AssessmentMethodId`
- `Observation.Start >= ProcessActivityBegin`
- `Observation.Start < ProcessActivityEnd`

or:

- `ProcessActivityEnd` is `NULL`

**Why No Physical FK Can Be Defined**

The `SamplingProcess` primary key contains:

- `CountryCode`
- `ProcessId`
- `AssessmentMethodId`
- `ProcessActivityBegin`

The observation does not identify:

- `ProcessId`
- `ProcessActivityBegin`

The applicable process must therefore be determined from the observation time and the process validity period.

````

````{dropdown} SamplingPointLocation and SamplingProcess ↔ ObservationMeasurementResultPNSD

**Relationship**

Similarly as observations, the PNSD observations must correspond to:

- an existing `SamplingPoint`;
- a valid `SamplingPointLocation`;
- an active `SamplingProcess`.

The relationship to `SamplingPoint` can be implemented through a physical FK.

The location and process relationships remain logical.

**Why No Physical FK Can Be Defined**

Similarly as observations, the PNSD observations do not contain the complete primary key of the applicable location or process record.

The correct record is selected using the PNSD observation timestamp.

````

````{dropdown} AssessmentRegimeZone → ZoneGeometry

**Relationship**

For assessment regimes represented by a reported AQ zone:

`AssessmentRegimeZone`
```
(CountryCode, ZoneId)
```

uses

`ZoneGeometry`
```
(CountryCode, ZoneId)
```

**Why No Physical FK Can Be Defined**

The equality columns correspond to the documented `ZoneGeometry` key.

However, a geometry record may not be required for every possible zone reference. An assessment-regime record may instead identify an area through a NUTS reference (`ZoneCategory = 'nuts'`).

A mandatory physical FK would reject such valid records.

The relationship is therefore conditional on the zone type or zone category.

The data types and lengths of `ZoneId` must also be compatible before a physical relationship could be considered.

````

````{dropdown} ComplianceAssessmentMethod → SamplingPoint or ModelObjectiveEstimation

**Relationship**

`ComplianceAssessmentMethod.AssessmentMethodId` may identify either:

- `SamplingPoint.AssessmentMethodId`

or

- `ModelObjectiveEstimation.AssessmentMethodId`

For a model or objective-estimation method, `DataAggregationProcessId` is also relevant.

**Why No Physical FK Can Be Defined**

This is an **alternative-parent relationship**.

A foreign key to `SamplingPoint` would reject model records.

A foreign key to `ModelObjectiveEstimation` would reject sampling-point records.

Applying both would incorrectly require every assessment method to exist in both tables.

The correct target table must be selected according to the assessment-method type.

````

````{dropdown} ComplianceAssessmentMethod → SpatialRepresentativeness

**Relationship**

`ComplianceAssessmentMethod`

```
(CountryCode, SRSId)
```

uses one or more

`SpatialRepresentativeness`

```
(CountryCode, SRSId, SRSApplicationId)
```

One `SRSId` may have several applications.

**Why No Physical FK Can Be Defined**

`ComplianceAssessmentMethod` does not contain `SRSApplicationId`, which forms part of the `SpatialRepresentativeness` primary key.

The compliance record intentionally points to the complete SRS group rather than to one particular SRS application, as it may be related both:

- to the spatial representativeness area of a sampling point;
- to the exceedance extent (when the compliance record describes an exceedance).

````

````{dropdown} SpatialRepresentativeness ↔ SRSInline

**Relationship**

`SRSInline` stores a potentially large inline spatial result dataset identified by:

`CountryCode + SRSApplicationId`

The same application dataset may be used by more than one `SpatialRepresentativeness` record.

Example:

**SpatialRepresentativeness**

```
CountryCode | SRSId   | SRSApplicationId
------------+---------+-----------------
DK          | SRS-001 | APP-01
DK          | SRS-002 | APP-01
```

The shared geometry or grid dataset is stored once:

**SRSInline**

```
CountryCode | SRSApplicationId | X  | Y
------------+------------------+----+----
DK          | APP-01           | X1 | Y1
DK          | APP-01           | X2 | Y2
DK          | APP-01           | X3 | Y3
...
```

All rows belonging to application `APP-01` are used by both SRS records.

**Why No Physical FK Can Be Defined**

The `SpatialRepresentativeness` primary key is:

- `CountryCode`
- `SRSId`
- `SRSApplicationId`

`SRSInline` contains only:

- `CountryCode`
- `SRSApplicationId`

The shorter combination in `SpatialRepresentativeness` is intentionally not necessarily unique.

The same application dataset may belong to several `SRSId` values.

Repeating `SRSId` in every `SRSInline` geometry or grid-cell row would:

- duplicate the value over potentially thousands of rows;
- increase the amount of submitted data;
- incorrectly represent a shared application dataset as separate duplicated datasets.

The logical rule is:

> Every `SRSInline` application dataset must be used by at least one `SpatialRepresentativeness` record with the same `CountryCode` and `SRSApplicationId`.

Validation that the corresponding `SpatialRepresentativeness` record uses **'inline'** result encoding remains a separate logical consistency rule.

````

````{dropdown} SpatialRepresentativeness ↔ SRSExternal

**Relationship**

`SRSExternal` stores an external spatial dataset identified by:

`CountryCode + SRSApplicationId`

The external result may be used by one or more `SpatialRepresentativeness` records.

**Why No Physical FK Can Be Defined**

`SRSExternal` does not contain `SRSId`, while the complete `SpatialRepresentativeness` primary key does.

The combination:

`CountryCode + SRSApplicationId`

may legitimately match several `SpatialRepresentativeness` records.

The external result dataset is deliberately stored once and shared.

Validation that the corresponding `SpatialRepresentativeness` record uses **'external'** result encoding remains a separate logical consistency rule.

````

````{dropdown} SpatialRepresentativeness → ModelObjectiveEstimation

**Relationship**

`SpatialRepresentativeness.RepresentativenessAssessmentMethodId`

identifies

`ModelObjectiveEstimation.AssessmentMethodId`

The model or objective-estimation method is used for generating the spatial-representativeness result.

**Why No Physical FK Can Be Defined**

The complete `ModelObjectiveEstimation` primary key also contains:

- `DataAggregationProcessId`

`SpatialRepresentativeness` does not contain the complete parent key.

The relationship identifies the assessment method generally, rather than one uniquely identified method-and-aggregation row.

**Derivation and Use of DataAggregationProcessId**

The `DataAggregationProcessId` corresponding to `SpatialRepresentativeness.RepresentativenessAssessmentMethodId` may be derived indirectly through the associated `SRSId` in the `ComplianceAssessmentMethod` table.

The relationship can be interpreted as follows:

```
SpatialRepresentativeness.SRSId
    → ComplianceAssessmentMethod.SRSId

ComplianceAssessmentMethod.DataAggregationProcessId
    → ModelObjectiveEstimation.DataAggregationProcessId
```

This derived value may be useful for comparison with the `DataAggregationProcessId` of the corresponding `AssessmentMethodId` in the `ModelObjectiveEstimation` table.

However, this comparison should **not** be interpreted as a mandatory equality rule.

A spatial-representativeness area produced using modelling results for one aggregation type (for example an annual mean) may also be applicable to other aggregation types.

Consequently, the derived `DataAggregationProcessId` should be treated primarily as contextual or consistency information rather than as a required component of a physical PK–FK relationship or a strict validation condition.

````

````{dropdown} ComplianceAssessmentMethod ↔ PollutionLevelAdjustment

**Relationship**

`PollutionLevelAdjustment`

```
(CountryCode, AttainmentId)
```

corresponds to

`ComplianceAssessmentMethod`

```
(CountryCode, AttainmentId)
```

The adjustment belongs to the compliance or attainment situation represented by `AttainmentId`.

**Why No Physical FK Can Be Defined**

`AttainmentId` is not the complete primary key of `ComplianceAssessmentMethod`.

The CAM primary key also includes:

- `ReportingYear`
- `AssessmentRegimeId`
- `DataAggregationProcessId`
- `AssessmentMethodId`

The adjustment refers to the attainment context rather than to one complete CAM row.

````

````{dropdown} PollutionLevelAdjustment → ModelObjectiveEstimation

**Relationship**

`PollutionLevelAdjustment.AdjustmentAssessmentMethodId`

identifies

`ModelObjectiveEstimation.AssessmentMethodId`

The referenced model or objective-estimation method is used to calculate the adjustment.

**Why No Physical FK Can Be Defined**

The adjustment table does not contain:

- `DataAggregationProcessId`

which forms part of the complete `ModelObjectiveEstimation` primary key.

The relationship is therefore at assessment-method level rather than at one specific model-and-aggregation record.

**Derivation and Use of DataAggregationProcessId**

The `DataAggregationProcessId` corresponding to `PollutionLevelAdjustment.AdjustmentAssessmentMethodId` may be derived indirectly through the associated `AttainmentId` in the `ComplianceAssessmentMethod` table.

The relationship can be interpreted as follows:

```
PollutionLevelAdjustment.AttainmentId
    → ComplianceAssessmentMethod.AttainmentId

ComplianceAssessmentMethod.DataAggregationProcessId
    → ModelObjectiveEstimation.DataAggregationProcessId
```

This derived value may be useful for comparison with the `DataAggregationProcessId` of the corresponding `AssessmentMethodId` in the `ModelObjectiveEstimation` table.

However, this comparison should **not** be interpreted as a mandatory equality rule.

The temporal resolution of the modelling results used to calculate an adjustment is expected to be finer than the target aggregation type to which the adjustment is applied.

For example, daily adjustment values may be used to adjust an annual mean or to calculate an adjusted number of exceedance days.

Consequently, the derived `DataAggregationProcessId` should be treated primarily as contextual or comparison information rather than as a required component of a physical PK–FK relationship or a strict validation condition.

````

````{dropdown} ComplianceAssessmentMethod ↔ CompliancePlanLink

**Relationship**

`CompliancePlanLink`

```
(CountryCode, AttainmentId)
```

corresponds to

`ComplianceAssessmentMethod`

```
(CountryCode, AttainmentId)
```

The plan link associates an attainment situation with:

- a plan;
- a scenario;
- a source-apportionment dataset.

**Why No Physical FK Can Be Defined**

`AttainmentId` is not the complete `ComplianceAssessmentMethod` primary key.

The relationship points to the attainment context, which may be represented by a wider set of CAM records (for example several assessment methods indicating exceedance under the same `AttainmentId`).

````

````{dropdown} CompliancePlanLink → PlanScenario

**Relationship**

`CompliancePlanLink`

```
(CountryCode, PlanId, ScenarioId)
```

corresponds to

`PlanScenario`

```
(CountryCode, PlanId, ScenarioId, ScenarioCategory)
```

**Why No Physical FK Can Be Defined**

`CompliancePlanLink` does not contain `ScenarioCategory`, which forms part of the `PlanScenario` primary key.

The link points to the plan-and-scenario context without identifying one scenario-category row.

In other words, it points to the whole scenario-category set for each scenario.

````

````{dropdown} CompliancePlanLink → SourceApportionment

**Relationship**

`CompliancePlanLink`

```
(CountryCode, SourceApportionmentId)
```

uses all `SourceApportionment` rows having the same

```
(CountryCode, SourceApportionmentId)
```

**SourceApportionment Primary Key**

- `CountryCode`
- `SourceApportionmentId`
- `ContributionType`
- `SpatialScale`
- `SourceSector`

**Why No Physical FK Can Be Defined**

`SourceApportionmentId` identifies an entire source-apportionment dataset containing several contribution rows.

`CompliancePlanLink` does not identify one individual contribution row and therefore does not contain:

- `ContributionType`
- `SpatialScale`
- `SourceSector`

This is a **group relationship**.

````

````{dropdown} PlanScenario ↔ ScenarioMeasure

**Relationship**

`ScenarioMeasure`

```
(CountryCode, ScenarioId, ScenarioCategory)
```

corresponds to

`PlanScenario`

```
(CountryCode, PlanId, ScenarioId, ScenarioCategory)
```

**Why No Physical FK Can Be Defined**

`ScenarioMeasure` does not contain `PlanId`, which forms part of the `PlanScenario` primary key.

The scenario-measure record identifies the scenario context but without pointing directly to a plan.

````

````{dropdown} ScenarioMeasure → Measure

**Relationship**

`ScenarioMeasure`

```
(CountryCode, MeasureGroupId)
```

uses all `Measure` records having the same

```
(CountryCode, MeasureGroupId)
```

**Measure Primary Key**

- `CountryCode`
- `MeasureGroupId`
- `MeasureId`

**Why No Physical FK Can Be Defined**

`ScenarioMeasure` points to a measure group included in a given scenario-category, not to one individual measure.

It does not contain `MeasureId`.

Conversely, `Measure` does not contain the scenario attributes required to refer to the complete `ScenarioMeasure` primary key.

This is a **group relationship**.

````

````{dropdown} ScenarioMeasure → ModelObjectiveEstimation

**Relationship**

`ScenarioMeasure.MeasureReductionAssessmentMethodId`

identifies

`ModelObjectiveEstimation.AssessmentMethodId`

The method is used to estimate the reduction associated with the measure group.

**Why No Physical FK Can Be Defined**

`ScenarioMeasure` does not contain `DataAggregationProcessId`, which forms part of the complete primary key of `ModelObjectiveEstimation`.

Consequently, `ScenarioMeasure.MeasureReductionAssessmentMethodId` alone does not uniquely identify a corresponding `ModelObjectiveEstimation` record, and a conventional SQL foreign key cannot be defined.

**Derivation and Use of DataAggregationProcessId**

The missing `DataAggregationProcessId` can be derived indirectly through the associated `ScenarioId` in the `PlanScenario` table.

The relationship can be interpreted as follows:

```
ScenarioMeasure.ScenarioId
    → PlanScenario.ScenarioId

PlanScenario.DataAggregationProcessId
    → ModelObjectiveEstimation.DataAggregationProcessId
```

The derived `DataAggregationProcessId`, together with `MeasureReductionAssessmentMethodId`, provides the complete identifier required to locate the corresponding `ModelObjectiveEstimation` record.

Unlike the relationships involving `SpatialRepresentativeness` and `PollutionLevelAdjustment`, the aggregation process is expected to be fully consistent throughout this relationship.

Therefore, the `DataAggregationProcessId` derived through `PlanScenario` **should be identical** to the `DataAggregationProcessId` of the corresponding `AssessmentMethodId` in the `ModelObjectiveEstimation` table.

Any discrepancy should be considered an inconsistency in the reported data and should be reported as a validation error.

Although the relationship cannot be implemented as a conventional physical foreign key because `ScenarioMeasure` does not directly contain the complete parent primary key, the derivation described above provides a deterministic mapping that can be used for validation purposes.

````