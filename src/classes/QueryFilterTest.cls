@isTest
private class QueryFilterTest {
    @isTest
    static void testFilterStrategy() {
        Filter equalsFilter = new EqualsFilter();
        String filterQuery = equalsFilter.apply('Name', '=', ':p0');
        System.assertEquals('Name = :p0', filterQuery);
        
        Filter likeFilter = new LikeFilter();
        String likeQuery = likeFilter.apply('Name', 'LIKE', ':p0');
        System.assertEquals('Name LIKE :p0', likeQuery);
    }
}
