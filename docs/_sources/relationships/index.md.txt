# Table Relationships

```{toctree}
:hidden:
:maxdepth: 1

physical-pk-fk
logical-relationships
documentation-relationships
physical-summary
logical-summary
summary
```

## Purpose

This document describes the relationships between tables in the AQ eReporting reporting schema.

The relationships are divided into two categories:

1. Physical primary key–foreign key relationships
2. Logical relationships that cannot be represented correctly by a conventional SQL foreign key

The classification is made per relationship rather than per table.

A table may therefore participate in:

- a physical foreign key relationship with one table; and
- a logical relationship with another table.

## Relationship Categories

### Physical PK–FK Relationships

A physical foreign key can be defined where:

- the parent columns form the complete documented primary key;
- the child table contains all columns of the parent key;
- the relationship points to one uniquely identifiable parent row;
- the relationship applies unconditionally;
- the relationship is based on equality between columns;
- the relationship does not depend on dates, types, categories, shared datasets or alternative parent tables.

### Logical Relationships

A relationship remains logical where:

- the child contains only part of the parent primary key;
- the child refers to a group of parent records;
- one result dataset is shared by several parent records;
- the target parent table depends on a type or discriminator;
- the relationship depends on a validity period;
- the relationship uses a business identifier that is not the complete parent key;
- the relationship requires additional context;
- the relationship applies only under certain conditions;
- the relationship cannot be represented correctly through a standard equality-based foreign key.