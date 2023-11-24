function miniMaxSum(arr) {
    var minSum = Infinity;
    var maxSum = 0;
    var totalSum = 0;
    var oddNum = [];
    var evenNum = [];

    // Iterate array
    for (var i = 0; i < arr.length; i++) {
        totalSum += arr[i];
        // Update min and max sums
        minSum = Math.min(totalSum, totalSum-arr[i]+1);
        maxSum = Math.max(maxSum, totalSum - arr[i]);
        if ( i >= 4 -1) {
            maxSum = Math.max(maxSum,totalSum);
            totalSum-=arr[i-4+1];
        }
        if ( arr[i] % 2 === 0) {
            evenNum.push(arr[i]);
        }
        else if ( arr[i] % 2 == 1) {
            oddNum.push(arr[i]);
        }
    }


    // Print the results
    console.log("Min of an array is :" + minSum + "\n", "Max of an array is : " + maxSum);
    console.log("Even Number is: " + evenNum);
    console.log("Odd Number is : " + oddNum);
}

// Example usage:
var inputArray = [1, 2, 3, 4, 5];
miniMaxSum(inputArray);
