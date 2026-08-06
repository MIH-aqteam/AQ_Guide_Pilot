# Physical PK–FK Relationships

````{dropdown} MeasurementStation ← SamplingPoint

**Relationship Description**

Every **SamplingPoint** belongs to one **MeasurementStation**.

The parent station is uniquely identified by:

- `CountryCode`
- `StationEoICode`

The child contains the complete documented primary key of the parent.

**MeasurementStation Primary Key**

```sql
ALTER TABLE [reporting].[MeasurementStation]
ADD CONSTRAINT [PK_MeasurementStation]
PRIMARY KEY
(
    [CountryCode],
    [StationEoICode]
);
```

**SamplingPoint Primary Key**

```sql
ALTER TABLE [reporting].[SamplingPoint]
ADD CONSTRAINT [PK_SamplingPoint]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[SamplingPoint]
ADD CONSTRAINT [FK_SamplingPoint_MeasurementStation]
FOREIGN KEY
(
    [CountryCode],
    [StationEoICode]
)
REFERENCES [reporting].[MeasurementStation]
(
    [CountryCode],
    [StationEoICode]
);
```

````

````{dropdown} SamplingPoint ← SamplingPointLocation

**Relationship Description**

Every **SamplingPointLocation** record belongs to one **SamplingPoint**.

`LocationBegin` distinguishes different location-validity periods for the same sampling point.

It is part of the child primary key, but it is not required to identify the parent sampling point.

A sampling point may have:

- several different sampling point locations;
- several successive validity periods for the same location.

**SamplingPointLocation Primary Key**

```sql
ALTER TABLE [reporting].[SamplingPointLocation]
ADD CONSTRAINT [PK_SamplingPointLocation]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [LocationBegin]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[SamplingPointLocation]
ADD CONSTRAINT [FK_SamplingPointLocation_SamplingPoint]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentMethodId]
)
REFERENCES [reporting].[SamplingPoint]
(
    [CountryCode],
    [AssessmentMethodId]
);
```

````

````{dropdown} SamplingPoint ← SamplingProcess

**Relationship Description**

Every **SamplingProcess** record belongs to one **SamplingPoint**.

A sampling point may have:

- several different sampling processes;
- several successive validity periods for the same process.

**SamplingProcess Primary Key**

```sql
ALTER TABLE [reporting].[SamplingProcess]
ADD CONSTRAINT [PK_SamplingProcess]
PRIMARY KEY
(
    [CountryCode],
    [ProcessId],
    [AssessmentMethodId],
    [ProcessActivityBegin]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[SamplingProcess]
ADD CONSTRAINT [FK_SamplingProcess_SamplingPoint]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentMethodId]
)
REFERENCES [reporting].[SamplingPoint]
(
    [CountryCode],
    [AssessmentMethodId]
);
```

````

````{dropdown} SamplingPoint ← ObservationMeasurementResult

**Relationship Description**

Every observation result belongs to an existing **SamplingPoint**.

The physical foreign key confirms that the sampling point exists.

**ObservationMeasurementResult Primary Key**

```sql
ALTER TABLE [reporting].[ObservationMeasurementResult]
ADD CONSTRAINT [PK_ObservationMeasurementResult]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [Start]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[ObservationMeasurementResult]
ADD CONSTRAINT [FK_ObservationMeasurementResult_SamplingPoint]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentMethodId]
)
REFERENCES [reporting].[SamplingPoint]
(
    [CountryCode],
    [AssessmentMethodId]
);
```

**Additional Logical Relationships**

The following observation relationships remain logical:

```text
ObservationMeasurementResult
    ↔ SamplingPointLocation through the observation validity period

ObservationMeasurementResult
    ↔ SamplingProcess through the observation validity period
```

The correct location and process records are determined from the observation timestamp.

````

````{dropdown} SamplingPoint ← ObservationMeasurementResultPNSD

**Relationship Description**

Every **PNSD observation** belongs to one existing **SamplingPoint**.

The combination:

- `CountryCode`
- `AssessmentMethodId`
- `Start`
- `LowerRange`

uniquely identifies an individual PNSD result row.

`LowerRange` distinguishes different particle-size intervals reported for the same sampling point and observation start time.

It is part of the child primary key but is not needed to identify the parent **SamplingPoint**.

The relationship to **SamplingPoint** therefore remains a proper physical PK–FK relationship.

**ObservationMeasurementResultPNSD Primary Key**

The documented primary key includes `LowerRange`.

```sql
ALTER TABLE [reporting].[ObservationMeasurementResultPNSD]
ADD CONSTRAINT [PK_ObservationMeasurementResultPNSD]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [Start],
    [LowerRange]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[ObservationMeasurementResultPNSD]
ADD CONSTRAINT [FK_ObservationMeasurementResultPNSD_SamplingPoint]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentMethodId]
)
REFERENCES [reporting].[SamplingPoint]
(
    [CountryCode],
    [AssessmentMethodId]
);
```

**Additional Logical Relationships**

The following PNSD relationships remain logical:

```text
ObservationMeasurementResultPNSD
    ↔ SamplingPointLocation through the observation validity period

ObservationMeasurementResultPNSD
    ↔ SamplingProcess through the observation validity period
```

The correct location and process records are determined from the PNSD observation timestamp.

````

````{dropdown} ModelObjectiveEstimation ← MOEResultInline

**Relationship Description**

Every inline model grid-cell result belongs to one model or objective-estimation definition and one aggregation process.

The following child columns identify the individual result cell:

- `Start`
- `X`
- `Y`

They are not required to identify the parent method.

Validation that the parent record uses `inline` result encoding remains a separate logical consistency rule.

**ModelObjectiveEstimation Primary Key**

```sql
ALTER TABLE [reporting].[ModelObjectiveEstimation]
ADD CONSTRAINT [PK_ModelObjectiveEstimation]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [DataAggregationProcessId]
);
```

**MOEResultInline Primary Key**

```sql
ALTER TABLE [reporting].[MOEResultInline]
ADD CONSTRAINT [PK_MOEResultInline]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [Start],
    [DataAggregationProcessId],
    [X],
    [Y]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[MOEResultInline]
ADD CONSTRAINT [FK_MOEResultInline_ModelObjectiveEstimation]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [DataAggregationProcessId]
)
REFERENCES [reporting].[ModelObjectiveEstimation]
(
    [CountryCode],
    [AssessmentMethodId],
    [DataAggregationProcessId]
);
```

````

````{dropdown} ModelObjectiveEstimation ← MOEResultExternal

**Relationship Description**

Every external model result belongs to one model or objective-estimation definition and one aggregation process.

The physical FK establishes that the model definition exists.

Validation that the parent record uses **'external'** result encoding remains a separate logical consistency rule.

**MOEResultExternal Primary Key**

```sql
ALTER TABLE [reporting].[MOEResultExternal]
ADD CONSTRAINT [PK_MOEResultExternal]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [Start],
    [DataAggregationProcessId]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[MOEResultExternal]
ADD CONSTRAINT [FK_MOEResultExternal_ModelObjectiveEstimation]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentMethodId],
    [DataAggregationProcessId]
)
REFERENCES [reporting].[ModelObjectiveEstimation]
(
    [CountryCode],
    [AssessmentMethodId],
    [DataAggregationProcessId]
);
```

````

````{dropdown} AssessmentRegimeZone ← ComplianceAssessmentMethod

**Relationship Description**

Every **ComplianceAssessmentMethod** record belongs to one assessment regime.

The child contains the complete documented PK of **AssessmentRegimeZone**.

**AssessmentRegimeZone Primary Key**

```sql
ALTER TABLE [reporting].[AssessmentRegimeZone]
ADD CONSTRAINT [PK_AssessmentRegimeZone]
PRIMARY KEY
(
    [CountryCode],
    [AssessmentRegimeId]
);
```

**ComplianceAssessmentMethod Primary Key**

```sql
ALTER TABLE [reporting].[ComplianceAssessmentMethod]
ADD CONSTRAINT [PK_ComplianceAssessmentMethod]
PRIMARY KEY
(
    [CountryCode],
    [ReportingYear],
    [AssessmentRegimeId],
    [DataAggregationProcessId],
    [AssessmentMethodId]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[ComplianceAssessmentMethod]
ADD CONSTRAINT [FK_ComplianceAssessmentMethod_AssessmentRegimeZone]
FOREIGN KEY
(
    [CountryCode],
    [AssessmentRegimeId]
)
REFERENCES [reporting].[AssessmentRegimeZone]
(
    [CountryCode],
    [AssessmentRegimeId]
);
```

````

````{dropdown} ModelObjectiveEstimation ← PlanScenario

**Relationship Description**

`ScenarioAssessmentMethodId` identifies the model or objective-estimation method used for the scenario and scenario category within a plan.

Together with:

- `CountryCode`
- `DataAggregationProcessId`

it resolves to the complete **ModelObjectiveEstimation** primary key.

The corresponding parent and child column names do not need to be identical, but:

- their meaning must correspond;
- their SQL data types must be compatible;
- their lengths must be compatible.

If `ScenarioAssessmentMethodId` is nullable, SQL Server permits a null FK value.

Whether the model reference is mandatory must therefore be enforced through nullability or separate validation.

**PlanScenario Primary Key**

```sql
ALTER TABLE [reporting].[PlanScenario]
ADD CONSTRAINT [PK_PlanScenario]
PRIMARY KEY
(
    [CountryCode],
    [PlanId],
    [ScenarioId],
    [ScenarioCategory]
);
```

**Foreign Key**

```sql
ALTER TABLE [reporting].[PlanScenario]
ADD CONSTRAINT [FK_PlanScenario_ModelObjectiveEstimation]
FOREIGN KEY
(
    [CountryCode],
    [ScenarioAssessmentMethodId],
    [DataAggregationProcessId]
)
REFERENCES [reporting].[ModelObjectiveEstimation]
(
    [CountryCode],
    [AssessmentMethodId],
    [DataAggregationProcessId]
);
```

````
