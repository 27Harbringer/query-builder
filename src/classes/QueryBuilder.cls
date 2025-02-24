public class QueryBuilder {
    private String objectName;
    private List<String> fields;
    private List<String> filters;
    private String orderBy;
    private Map<String, Object> bindVariables;
    
    public QueryBuilder(String objectName) {
        this.objectName = objectName;
        this.fields = new List<String>();
        this.filters = new List<String>();
        this.orderBy = '';
        this.bindVariables = new Map<String, Object>();
    }
    
    public QueryBuilder addFields(List<String> fields) {
        this.fields = fields;
        return this;
    }
    
    public QueryBuilder addFilter(String field, String operator, String value) {
        String bindKey = 'p' + bindVariables.size();
        this.bindVariables.put(bindKey, value);
        this.filters.add(field + ' ' + operator + ' :' + bindKey);
        return this;
    }
    
    public QueryBuilder addFilter(Filter filterStrategy, String field, String operator, String value) {
        String bindKey = 'p' + bindVariables.size();
        this.bindVariables.put(bindKey, value);
        this.filters.add(filterStrategy.apply(field, operator, ':' + bindKey));
        return this;
    }
    
    public QueryBuilder addOrderBy(String field, Boolean ascending) {
        this.orderBy = ' ORDER BY ' + field + (ascending ? ' ASC' : ' DESC');
        return this;
    }
    
    public QueryWithBindings build() {
        String selectFields = (fields == null || fields.isEmpty()) ? '*' : String.join(fields, ', ');
        String query = 'SELECT ' + selectFields + ' FROM ' + objectName;
        if (!filters.isEmpty()) {
            query += ' WHERE ' + String.join(filters, ' AND ');
        }
        query += orderBy;
        return new QueryWithBindings(query, bindVariables);
    }
}
