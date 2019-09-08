package com.yijia.enterprise.util;

import java.util.UUID;

public class IdBuilder {
    public IdBuilder() {
    }

    public static String getID() {
        UUID id = UUID.randomUUID();
        return id.toString().replaceAll("-", "");
    }
}