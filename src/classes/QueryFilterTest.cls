@isTest
private class QueryFilterTest {
    @isTest
    static void testFilterStrategy() {
        Filter equalsFilter = new EqualsFilter();
        String filterQuery = equalsFilter.apply('Name', '=', 'Acme');
        System.assertEquals('Name = \'Acme\'', filterQuery);
        
        Filter likeFilter = new LikeFilter();
        String likeQuery = likeFilter.apply('Name', 'LIKE', 'Acme%');
        System.assertEquals('Name LIKE \'Acme%\'', likeQuery);
    }
}
