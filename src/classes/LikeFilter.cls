public class LikeFilter implements Filter {
    public String apply(String field, String operator, String value) {
        return field + ' LIKE \'' + value + '\'';
    }
}