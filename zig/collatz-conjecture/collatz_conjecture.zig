pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) {
        return ComputationError.IllegalArgument;
    }
    var new_num: usize = number;
    var step_counter: usize = 0;
    while (new_num != 1) {
        if (new_num % 2 == 0) {
            new_num = new_num / 2;
        } else {
            new_num = 3 * new_num + 1;
        }
        step_counter += 1;
    }
    return step_counter;
}
