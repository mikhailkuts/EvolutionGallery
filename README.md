# EvolutionGallery

### Gallery layout.

Images layout calculating by selection the optimum place for each rectangle using spiral from center.

### Extra task. Create a Maven configuration pom.xml for the project. It should include a test runner and working build config.

Created at project folder.
You can run maven-runonce.* (libs local install) at project folder if Maven repository not available.

### Extra task. Write method that takes two sorted arrays of integers (can be of any range, numbers can repeat, sizes of arrays can be different) and returns array of n + m length which is sorted in the same order. Do not use any type of built-in sorting.

ArrayUtils.sortedMerge(arr1:Array, arr2:Array) and TestApp.arrayMergeTest(); for testing.

### Extra question. Explain what does this code do, how it works and what’s wrong with it:

xmlData.children().(@myVal % 2 && trace(@myVal));

- What does this code do:
This code tracing odd node attribute values.

- How it works:
XMLList can be filtered by logic expressions. In the example above occurs iterating on every element and checking attribute myVal on even or odd (trace attribute value if it odd).

- What’s wrong with it:
Nodes filtering not work using code above because Boolean(trace(@myVal)) always return false.
Also for tracing values ​​is better to use such a code: trace(xmlData.children().(@myVal % 2).@myVal);

