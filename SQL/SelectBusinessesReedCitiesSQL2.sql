-- SQL queries for businesses
lower(CONAME) LIKE lower('%southern%')
lower(CONAME) LIKE lower('%dixie%')
upper(CONAME) NOT LIKE upper('%WINN_DIXIE%') AND upper(CONAME) NOT LIKE upper('%WYNN_DIXIE%')   -- select non winndixie businesses from all dixie fc.
lower(CONAME) LIKE lower('%south %')
lower(CONAME) LIKE lower('%american%')