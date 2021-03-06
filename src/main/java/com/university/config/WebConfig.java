package com.university.config;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import freemarker.template.TemplateException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactory;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import java.io.IOException;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.university.controllers" })
public class WebConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/public/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/admin/**", "/student/**", "/teacher/**")
                .excludePathPatterns("/sign-in", "/teachers", "/student/enroll");
    }

    @Bean FreeMarkerConfigurer freeMarkerConfigurer() {
        final FreeMarkerConfigurationFactory factory = new FreeMarkerConfigurationFactory();
        factory.setTemplateLoaderPath("/templates");

        final FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        try {
            freeMarkerConfigurer.setConfiguration(factory.createConfiguration());
        } catch (IOException | TemplateException e) {
            throw new RuntimeException(e);
        }

        return freeMarkerConfigurer;
    }

    @Bean FreeMarkerViewResolver freeMarkerViewResolver() {
        final FreeMarkerViewResolver freeMarkerViewResolver = new FreeMarkerViewResolver();

        // TODO Semenets Change this value in future
        freeMarkerViewResolver.setCache(false);
        freeMarkerViewResolver.setPrefix("");
        freeMarkerViewResolver.setSuffix(".ftl");

        return freeMarkerViewResolver;
    }

    @Bean Gson serializer() {
        return new Gson();
    }

    @Bean JsonParser jsonParser() {
        return new JsonParser();
    }
}
