# Documentation Relationships

Documentation relationships are contextual relationships between the `Documentation` table and documentation-reference attributes contained in different reporting tables.

The applicable reporting table and documentation-reference attribute are determined by the combination of:

- `DataTable`;
- `DocumentType`;
- `DocumentId`;
- `CountryCode`.

---

````{dropdown} Documentation Primary Key

The `Documentation` table is identified by a contextual composite key.

**Documentation Primary Key**

```sql
ALTER TABLE [reporting].[Documentation]
ADD CONSTRAINT [PK_Documentation]
PRIMARY KEY
(
    [CountryCode],
    [DataTable],
    [DocumentType],
    [DocumentId]
);
```

````

---

````{dropdown} Meaning of DataTable

`Documentation.DataTable` indicates the reporting table in which a process must look for the documentation identifier.

For example:

```
DataTable = 'ModelObjectiveEstimation'
```

means that the `DocumentId` must be found in a documentation-reference column in:

```
[reporting].[ModelObjectiveEstimation]
```

Similarly:

```
DataTable = 'SamplingProcess'
```

means that the document identifier must be looked up in:

```
[reporting].[SamplingProcess]
```

`DataTable` therefore identifies the reporting-table context of the documentation reference.

````

---

````{dropdown} Meaning of DocumentType

`Documentation.DocumentType` identifies which documentation-reference attribute in the specified reporting table contains the `DocumentId`.

For example, `ModelObjectiveEstimation` may contain:

- `MethodDocumentId`;
- `DataQualityDocumentId`.

A documentation row with:

```
DataTable = 'ModelObjectiveEstimation'
DocumentType = 'MethodDocument'
DocumentId = 'DOC-001'
```

means that a process should search for `DOC-001` in:

```
ModelObjectiveEstimation.MethodDocumentId
```

A documentation row with:

```
DataTable = 'ModelObjectiveEstimation'
DocumentType = 'DataQualityDocument'
DocumentId = 'DOC-002'
```

means that a process should search for `DOC-002` in:

```
ModelObjectiveEstimation.DataQualityDocumentId
```

`DocumentType` therefore distinguishes between different documentation-reference attributes within the same reporting table.

````

---

````{dropdown} Documentation Lookup Logic

The relationship is not simply:

```
Child.DocumentId → Documentation.DocumentId
```

Instead, the lookup works as follows:

```
Documentation.DataTable
    identifies the reporting table

Documentation.DocumentType
    identifies the documentation-reference attribute in that table

Documentation.DocumentId
    is matched against the value reported in that attribute
```

Conceptually:

```
Documentation row
    (CountryCode, DataTable, DocumentType, DocumentId)

maps to

the row or rows in the indicated reporting table
where the documentation column selected by DocumentType
contains the same DocumentId
```

````

---

````{dropdown} Example — ModelObjectiveEstimation Documentation

Assume that `ModelObjectiveEstimation` contains:

- `MethodDocumentId`;
- `DataQualityDocumentId`.

**Method Document**

```
Documentation.DataTable
    = 'ModelObjectiveEstimation'

Documentation.DocumentType
    = 'MethodDocument'

Documentation.DocumentId
    is searched in
    ModelObjectiveEstimation.MethodDocumentId
```

**Data-Quality Document**

```
Documentation.DataTable
    = 'ModelObjectiveEstimation'

Documentation.DocumentType
    = 'DataQualityDocument'

Documentation.DocumentId
    is searched in
    ModelObjectiveEstimation.DataQualityDocumentId
```

The combination of `DataTable` and `DocumentType` determines which reporting table and which documentation-reference column must contain the identifier.

````

---

````{dropdown} Example — SamplingProcess Documentation

Assume that `SamplingProcess` contains:

- `DataQualityDocumentId`;
- `EquivalenceDemonstrationDocumentId`;
- `ProcessDocumentId`.

The corresponding mappings are conceptually:

```
DataTable = 'SamplingProcess'
DocumentType = 'DataQualityDocument'
    → SamplingProcess.DataQualityDocumentId

DataTable = 'SamplingProcess'
DocumentType = 'EquivalenceDemonstrationDocument'
    → SamplingProcess.EquivalenceDemonstrationDocumentId

DataTable = 'SamplingProcess'
DocumentType = 'ProcessDocument'
    → SamplingProcess.ProcessDocumentId
```

Each `DocumentType` value selects a different documentation-reference attribute in the same reporting table.

````

---

````{dropdown} Example — MeasurementStation Documentation

If `MeasurementStation` contains:

```
NetworkDocumentId
```

the corresponding logical mapping is:

```
DataTable = 'MeasurementStation'
DocumentType = 'NetworkDocument'
    → MeasurementStation.NetworkDocumentId
```

````

---

````{dropdown} Example — PollutionLevelAdjustment Documentation

If `PollutionLevelAdjustment` contains:

```
AdjustmentDocumentId
```

the corresponding mapping is:

```
DataTable = 'PollutionLevelAdjustment'
DocumentType = 'AdjustmentDocument'
    → PollutionLevelAdjustment.AdjustmentDocumentId
```

````

---

````{dropdown} Example — CompliancePlanLink Documentation

If `CompliancePlanLink` contains:

```
PlanDocumentId
```

the corresponding mapping is:

```
DataTable = 'CompliancePlanLink'
DocumentType = 'PlanDocument'
    → CompliancePlanLink.PlanDocumentId
```

````

---

````{dropdown} Example — SourceApportionment Documentation

If `SourceApportionment` contains:

```
SourceApportionmentDocumentId
```

the corresponding mapping is:

```
DataTable = 'SourceApportionment'
DocumentType = 'SourceApportionmentDocument'
    → SourceApportionment.SourceApportionmentDocumentId
```

````

---

````{dropdown} Direction of the Documentation Relationship

The documentation relationship can be interpreted from either direction.

**From a Reporting Table to Documentation**

A process reads a documentation-reference attribute, for example:

```
ModelObjectiveEstimation.MethodDocumentId = 'DOC-001'
```

It then expects a `Documentation` row containing:

```
CountryCode = the same country
DataTable = 'ModelObjectiveEstimation'
DocumentType = 'MethodDocument'
DocumentId = 'DOC-001'
```

**From Documentation to a Reporting Table**

A process reads the following values from the `Documentation` row:

```
CountryCode
DataTable
DocumentType
DocumentId
```

It then uses:

- `DataTable` to select the reporting table;
- `DocumentType` to select the documentation-reference attribute;
- `DocumentId` to find the matching value;
- `CountryCode` to restrict the lookup to the appropriate country.

````

---

````{dropdown} Why Documentation Relationships Are Not Physical FKs

Reporting tables normally contain:

```
CountryCode
a specific document identifier attribute
```

For example:

```
CountryCode
MethodDocumentId
```

or:

```
CountryCode
DataQualityDocumentId
```

The reporting rows do not physically contain:

```
DataTable
DocumentType
```

Those values are implied by:

- the reporting table in which the document identifier appears;
- the particular document-reference attribute being used.

A normal FK from:

```
ModelObjectiveEstimation
    (CountryCode, MethodDocumentId)
```

to:

```
Documentation
    (CountryCode, DataTable, DocumentType, DocumentId)
```

cannot be defined because the child does not contain the complete `Documentation` PK.

It would also be incorrect to reference only:

```
CountryCode + DocumentId
```

because the same `DocumentId` could potentially occur in different:

- table contexts;
- document-type contexts.

The relationship is therefore contextual and must be implemented through processing or QC validation.

````

---

````{dropdown} Documentation Mapping Specification

A mapping configuration may be used by the processing logic to define which `DocumentType` corresponds to which identifier attribute:

- **MeasurementStation**
  - Network → `NetworkDocumentId`
- **SamplingProcess**
  - DataQuality → `DataQualityDocumentId`
  - EquivalenceDemonstration → `EquivalenceDemonstrationDocumentId`
  - Process → `ProcessDocumentId`
- **ModelObjectiveEstimation**
  - Method → `MethodDocumentId`
  - DataQuality → `DataQualityDocumentId`
- **PollutionLevelAdjustment**
  - Adjustment → `AdjustmentDocumentId`
- **CompliancePlanLink**
  - Plan → `PlanDocumentId`
- **SourceApportionment**
  - SourceApportionment → `SourceApportionmentDocumentId`

The exact vocabulary values used in `DataTable` and `DocumentType` must correspond to the values defined in the reporting model.

Any additional documentation-reference attributes should be added to the mapping using the same principle.

````