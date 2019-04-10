package com.example.demo.repos;

import com.example.demo.domain.DemoEmail;
import org.springframework.data.repository.CrudRepository;

public interface EmailRepo extends CrudRepository<DemoEmail,Integer> {
}
