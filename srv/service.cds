using { com.sap.duarte as my } from '../db/entities.cds';

service CatalogService {
  
  @odata.draft.enabled
  entity User as projection on my.User;

  entity Task as projection on my.Task{
    *,
    0 as statusColor: Integer,
  }
}

