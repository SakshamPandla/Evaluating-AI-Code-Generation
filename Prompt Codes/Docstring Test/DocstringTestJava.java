//Add a docstring to the function that explains what it does.

public abstract class DataProcessor<T extends Number> {
    protected ProcessingStrategy<T> strategy;

    public DataProcessor(ProcessingStrategy<T> strategy) {
        this.strategy = strategy;
    }

    public final void execute(List<T> data) {
        List<T> filtered = filter(data);
        T result = strategy.process(filtered);
        report(result);
    }

    protected abstract List<T> filter(List<T> data);

    protected void report(T result) {
        System.out.println("Result: " + result);
    }
}