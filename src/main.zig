const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 159;
const risk_penalty: i32 = 7;
const latency_penalty: i32 = 3;
const weight_bonus: i32 = 4;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 61, .capacity = 100, .latency = 21, .risk = 22, .weight = 6 };
    try std.testing.expectEqual(@as(i32, 29), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 94, .capacity = 80, .latency = 12, .risk = 15, .weight = 9 };
    try std.testing.expectEqual(@as(i32, 163), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "accept"));
    const signal_case_3 = Signal{ .demand = 95, .capacity = 97, .latency = 12, .risk = 8, .weight = 8 };
    try std.testing.expectEqual(@as(i32, 227), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
