namespace mashupmodel;
using API_BUSINESS_PARTNER as bp from '../srv/external/csn/ODataServiceforBusinessPartner';

entity Books {
  key ID : Integer;
  title  : String;
  author : Association to Authors;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders {
  key ID : UUID;
  book   : Association to Books;
  buyer  : String;
  date   : DateTime;
  amount : Integer;
}


@cds.persistence.skip
entity SuppliersRemote as select from bp.A_SupplierType {
	key	Supplier		as ID,
		SupplierName    as Name,
} excluding {to_SupplierCompany, to_SupplierPurchasingOrg};

@cds.persistence: { skip: false, table: true }  // make the entity a table on DB
entity Suppliers as projection on SuppliersRemote;


extend entity Orders {
  supplier : Association to Suppliers;
};