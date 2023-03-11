package com.sist.global.error.exception;

import lombok.Getter;

import org.springframework.http.HttpStatus;

@Getter
public enum ErrorType {

    DUPLICATE_NICKNAME("ERRM001", HttpStatus.CONFLICT.value(), "사용 중인 닉네임입니다."),
    DUPLICATE_EMAIL("ERRM002", HttpStatus.CONFLICT.value(), "사용 중인 이메일입니다.");

    private final String code;

    private final int status;

    private final String message;

    ErrorType(String code, int status, String message) {
        this.code = code;
        this.status = status;
        this.message = message;
    }

}
