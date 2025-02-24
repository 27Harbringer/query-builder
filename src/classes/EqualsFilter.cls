public class EqualsFilter implements Filter {
    public String apply(String field, String operator, String value) {
        return field + ' = \'' + value + '\'';
    }
}