# Mashup application
The following example is used to show how to mashup data coming from an external source with data located on HANA DB.
The example shows a table name Orders which included among other fields, a field name "supplier" linked to the Supplier table generated as a projection of the SuppliersRemote one.

```
@cds.persistence: { skip: false, table: true }  // make the entity a table on DB
entity Suppliers as projection on SuppliersRemote;
```

The SuppliersRemote is just a subset of fields of the external source for the suppliers entity.

```
@cds.persistence.skip
entity SuppliersRemote as select from bp.A_SupplierType {
	key	Supplier		as ID,
		SupplierName    as Name,
} excluding {to_SupplierCompany, to_SupplierPurchasingOrg};

```
When running the example, you can retrieve orders expanding on suppliers

**.../odata/v2/MashupService/Orders/?$expand=supplier**
