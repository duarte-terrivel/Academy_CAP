using { com.sap.duarte as my } from '../db/entities.cds';

service CatalogService {
  
  @odata.draft.enabled
  entity User as projection on my.User;

  @odata.draft.enabled
  entity Task as projection on my.Task;
}




