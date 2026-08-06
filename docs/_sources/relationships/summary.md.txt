# Summary

The SQL specification distinguishes between physical referential constraints and logical relationships.

Physical foreign keys are proposed only where a child table contains the complete documented primary key of one uniquely identifiable parent row and where the relationship applies unconditionally.

Other documented relationships cannot be represented correctly using conventional SQL foreign keys under the current reporting model.

These include:

- temporal relationships;
- alternative-parent relationships;
- group-level references;
- shared result datasets;
- partial-key method references;
- conditional geographic relationships;
- contextual documentation references.

For documentation records:

- `DataTable` identifies the reporting table in which the documentation identifier must be located;
- `DocumentType` identifies the particular documentation-reference attribute within that table;
- `DocumentId` contains the identifier being matched;
- `CountryCode` restricts the relationship to the applicable country.

The absence of a physical FK for a relationship does not mean that the tables are unrelated.

It means that the relationship contains additional business semantics that cannot be expressed through an ordinary equality-based PK–FK constraint without changing the existing reporting-table design.

