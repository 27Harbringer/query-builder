public interface Filter {
    String apply(String field, String operator, String bindPlaceholder);
}