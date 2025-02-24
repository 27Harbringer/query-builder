public abstract class AbstractFilter implements Filter {
    protected String defaultOperator;
    
    public AbstractFilter(String defaultOperator) {
        this.defaultOperator = defaultOperator;
    }
    
    public String apply(String field, String operator, String bindPlaceholder) {
        return field + ' ' + this.defaultOperator + ' ' + bindPlaceholder;
    }
}
