@isTest
private class QueryBuilderTest {
    @isTest
    static void testSimpleQuery() {
        List<String> fields = new List<String>{'Name', 'Industry'};
        Map<String, String> filters = new Map<String, String>{'Name' => 'Acme', 'Industry' => 'Software'};
        
        String query = QueryFactory.createQuery('Account', fields, filters, 'Name', true);
        
        String expectedQuery = 'SELECT Name, Industry FROM Account WHERE Name = \'Acme\' AND Industry = \'Software\' ORDER BY Name ASC';
        System.assertEquals(expectedQuery, query);
    }
    
    @isTest
    static void testQueryWithFilterStrategy() {
        QueryBuilder builder = new QueryBuilder('Account');
        builder.addFields(new List<String>{'Name'});
        builder.addFilter(new EqualsFilter(), 'Name', '=', 'Acme');
        builder.addFilter(new LikeFilter(), 'Industry', 'LIKE', 'Soft%');
        builder.addOrderBy('Name', true);
        
        String query = builder.build();
        String expectedQuery = 'SELECT Name FROM Account WHERE Name = \'Acme\' AND Industry LIKE \'Soft%\' ORDER BY Name ASC';
        System.assertEquals(expectedQuery, query);
    }
}
