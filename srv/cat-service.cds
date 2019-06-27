using mashupmodel from '../db/data-model';

service MashupService {
  entity Books as projection on mashupmodel.Books;
  entity Authors @readonly as projection on mashupmodel.Authors;
  entity Orders @insertonly as projection on mashupmodel.Orders;
  entity Suppliers as projection on mashupmodel.Suppliers;

  //function GetSupplier(OrderID:UUID) returns Suppliers;
}
