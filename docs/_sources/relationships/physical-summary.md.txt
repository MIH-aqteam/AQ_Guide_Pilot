# Physical Relationship Summary

The following relationships can be represented by ordinary physical PK–FK constraints, subject to compatible SQL data types and valid existing data.

````{dropdown} Physical PK–FK Relationship List
:open:

- **MeasurementStation**
  - ← SamplingPoint

- **SamplingPoint**
  - ← SamplingPointLocation
  - ← SamplingProcess
  - ← ObservationMeasurementResult
  - ← ObservationMeasurementResultPNSD

- **ModelObjectiveEstimation**
  - ← MOEResultInline
  - ← MOEResultExternal
  - ← PlanScenario

- **AssessmentRegimeZone**
  - ← ComplianceAssessmentMethod
