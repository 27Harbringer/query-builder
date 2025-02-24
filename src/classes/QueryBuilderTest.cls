@isTest
private class QueryBuilderTest {
    @isTest
    static void testSimpleQuery() {
        List<String> fields = new List<String>{'Name', 'Industry'};
        Map<String, String> filters = new Map<String, String>{'Name' => 'Acme', 'Industry' => 'Software'};
        
        QueryWithBindings queryWithBindings = QueryFactory.createQuery('Account', fields, filters, 'Name', true);
        String query = queryWithBindings.query;
        
        String expectedQuery = 'SELECT Name, Industry FROM Account WHERE Name = :p0 AND Industry = :p1 ORDER BY Name ASC';
        System.assertEquals(expectedQuery, query);
        System.assertEquals('Acme', queryWithBindings.bindVariables.get('p0'));
        System.assertEquals('Software', queryWithBindings.bindVariables.get('p1'));
    }
    
    @isTest
    static void testQueryWithFilterStrategy() {
        QueryBuilder builder = new QueryBuilder('Account');
        builder.addFields(new List<String>{'Name'});
        builder.addFilter(new EqualsFilter(), 'Name', '=', 'Acme');
        builder.addFilter(new LikeFilter(), 'Industry', 'LIKE', 'Soft%');
        builder.addOrderBy('Name', true);
        
        QueryWithBindings queryWithBindings = builder.build();
        String query = queryWithBindings.query;
        String expectedQuery = 'SELECT Name FROM Account WHERE Name = :p0 AND Industry LIKE :p1 ORDER BY Name ASC';
        System.assertEquals(expectedQuery, query);
        System.assertEquals('Acme', queryWithBindings.bindVariables.get('p0'));
        System.assertEquals('Soft%', queryWithBindings.bindVariables.get('p1'));
    }
}
