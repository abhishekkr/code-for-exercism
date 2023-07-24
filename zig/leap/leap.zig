pub fn isLeapYear(year: u32) bool {
    return (year % 400 == 0) or (year % 4 == 0 and year % 100 != 0);
}

pub fn isLeapYearV1(year: u32) bool {
    if (year % 4 != 0) {
        return false;
    }
    if (year % 100 == 0 and year % 400 != 0) {
        return false;
    }
    return true;
}
