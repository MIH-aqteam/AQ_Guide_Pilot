# Logical Relationship Summary

The following relationships cannot be represented correctly as conventional physical PK–FK constraints under the current reporting model.

````{dropdown} Logical Relationship List
:open:

- **Authority**
  - → alternative entity tables

- **SamplingPointLocation**
  - ↔ ObservationMeasurementResult through validity periods
  - ↔ ObservationMeasurementResultPNSD through validity periods

- **SamplingProcess**
  - ↔ ObservationMeasurementResult through validity periods
  - ↔ ObservationMeasurementResultPNSD through validity periods

- **AssessmentRegimeZone**
  - → ZoneGeometry conditionally

- **ComplianceAssessmentMethod**
  - → SamplingPoint or ModelObjectiveEstimation
  - → SpatialRepresentativeness group
  - ← PollutionLevelAdjustment through AttainmentId
  - ← CompliancePlanLink through AttainmentId

- **SpatialRepresentativeness**
  - ↔ SRSInline shared application dataset
  - ↔ SRSExternal shared application dataset
  - → ModelObjectiveEstimation through a method identifier

- **PollutionLevelAdjustment**
  - → ModelObjectiveEstimation through a partial model key

- **CompliancePlanLink**
  - → PlanScenario through a partial key
  - → SourceApportionment group

- **PlanScenario**
  - ↔ ScenarioMeasure through a partial key

- **ScenarioMeasure**
  - → Measure group
  - → ModelObjectiveEstimation through a partial model key

- **Documentation**
  - ↔ reporting-table documentation attributes using
    `DataTable + DocumentType + DocumentId`
