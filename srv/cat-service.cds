using my.bookshop as my from '../db/data-model';

service CatalogService @(requires: 'authenticated-user') {
    @readonly entity Books @(restrict: [
           {
              grant: 'READ',
               to   : 'RiskViewer'
           },
          {
              grant: [
                  'READ',
                   'WRITE',
                   'UPDATE',
                   'UPSERT',
                   'DELETE'
               ], // Allowing CDS events by explicitly mentioning them
               to   : 'RiskManager'
           }
       ])  as projection on my.Books;
}
