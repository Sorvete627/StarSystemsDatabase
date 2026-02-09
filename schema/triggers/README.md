## Trigger Design Decisions

Triggers are used only when a business rule cannot be reliably enforced
through relational modeling or database constraints alone.

All triggers are defined as AFTER INSERT, UPDATE to ensure that:
- the transaction is executed only if no business rule is violated;
- invalid operations are rolled back before being committed;
- data consistency is preserved not only on creation, but also on updates.

UPDATE events are explicitly handled because every data modification
must be revalidated against the same business rules applied during insertion.

The logical `Inserted` table is used to inspect the affected rows and
validate them in a set-based manner, allowing multi-row INSERT and UPDATE
operations to be safely processed.

IF EXISTS is used to detect whether at least one row violates the business
rule, ensuring that batch operations fail atomically when invalid data
is present.

SET NOCOUNT ON is applied to avoid unnecessary result messages, since
triggers may affect multiple rows and do not need to return row count
information.
