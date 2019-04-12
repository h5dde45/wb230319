package com.example.demo.repos;

import com.example.demo.domain.TempUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TempUserRepo extends JpaRepository<TempUser, Long> {
    TempUser findByActivationCode(String code);
}
