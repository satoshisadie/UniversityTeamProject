package com.university.utils;

import java.util.UUID;

public class CommonUtils {

    public static long generateId() {
        return Math.abs(UUID.randomUUID().getMostSignificantBits());
    }
}
