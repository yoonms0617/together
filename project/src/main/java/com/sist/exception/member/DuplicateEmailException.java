package com.sist.exception.member;

import com.sist.global.error.exception.BaseException;
import com.sist.global.error.exception.ErrorType;

public class DuplicateEmailException extends BaseException {

    public DuplicateEmailException(ErrorType errorType) {
        super(errorType);
    }

}
