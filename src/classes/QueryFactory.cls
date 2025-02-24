public class QueryFactory {
    public static QueryWithBindings createQuery(String sObjectName, List<String> fields, Map<String, String> filters, String orderByField, Boolean ascending) {
        QueryBuilder builder = new QueryBuilder(sObjectName);
        builder.addFields(fields);
        
        for(String field : filters.keySet()) {
            builder.addFilter(field, '=', filters.get(field));
        }
        
        if(orderByField != null) {
            builder.addOrderBy(orderByField, ascending);
        }
        
        return builder.build();
    }
}
