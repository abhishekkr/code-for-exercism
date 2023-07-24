pub fn squareOfSum(number: usize) usize {
    const sum: usize = ((number * (number + 1)) / 2);
    return sum * sum;

    // // NON-ALGEBRAIC METHOD
    // var sum: usize = 0;
    // for (0..number + 1) |i| {
    //     sum += i;
    // }
    // return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    return ((number * (number + 1) * (2 * number + 1)) / 6);

    // // NON-ALGEBRAIC METHOD
    // var sum: usize = 0;
    // for (0..number + 1) |i| {
    //     sum += (i * i);
    // }
    // return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    var sqOfSum = squareOfSum(number);
    var sumOfSq = sumOfSquares(number);
    return (sqOfSum - sumOfSq);
}
