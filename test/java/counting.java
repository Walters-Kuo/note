import java.util.concurrent.atomic.AtomicInteger;

public class CountingBetter {
    
    public static void main(String[] args) throws InterruptedException {

        final AtomicInteger counter = new AtomicInteger(0);

	    /*
        class Counter {
	        int counter = 0;
	        public void increment() { counter++; }
	        public int get() { return counter; }
	    }
        
        class Counter {
            int counter = 0;
            public synchronized void increase() { counter++; }
            public synchronized int get() { return counter; }
        }

        final Counter counter = new Counter();
        */
        class CountingThread extends Thread {
            public void  run() {
                for (int x = 0; x < 500000; x++) {
                    counter.increase();
                }
            }
        }

        CountingThread t1 = new CountingThread();
        CountingThread t2 = new CountingThread();
        t1.start(); t2.start();
        t1.join(); t2.join();
        System.out.println(counter.get());
    }
}