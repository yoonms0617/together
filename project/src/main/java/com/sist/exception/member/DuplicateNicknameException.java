package com.sist.exception.member;

import com.sist.global.error.exception.BaseException;
import com.sist.global.error.exception.ErrorType;

public class DuplicateNicknameException extends BaseException {

    public DuplicateNicknameException(ErrorType errorType) {
        super(errorType);
    }

}
