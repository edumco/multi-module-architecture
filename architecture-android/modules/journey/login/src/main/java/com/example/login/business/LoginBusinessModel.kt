package com.example.login.business

import com.example.login.business.repository.local.LoginStorage
import com.example.login.business.repository.remote.LoginApi
import com.example.login.presentation.LoginFragmentUseCase

class LoginBusinessModel(
    private val api: LoginApi,
    private val storage: LoginStorage
) : LoginFragmentUseCase {
    override suspend fun login(user: String, password: String): Boolean {
        val userName = api.login(user, password)
        storage.save(userName)
        Thread.sleep(3_000)
        return true
    }
}
