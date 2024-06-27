package com.lpthinh.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.lpthinh.formatters.CategoryFormatter;
import com.lpthinh.formatters.DestinationFormatter;
import com.lpthinh.formatters.TicketTypeFormatter;
import com.lpthinh.formatters.TourDetailFormatter;
import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author admin
 */
@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.lpthinh.controllers",
    "com.lpthinh.repositories",
    "com.lpthinh.services"
})
public class WebApplicationContextConfig implements WebMvcConfigurer {

    @Autowired
    private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

    @PostConstruct
    public void init() {
        requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
        registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
        registry.addResourceHandler("/icons/**").addResourceLocations("/resources/icons/");
    }

//    @Bean
//    public InternalResourceViewResolver internalResourceViewResolver() {
//        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//        resolver.setViewClass(JstlView.class);
//        resolver.setPrefix("/WEB-INF/pages/");
//        resolver.setSuffix(".jsp");
//
//        return resolver;
//    }
    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new DestinationFormatter());
        registry.addFormatter(new CategoryFormatter());
        registry.addFormatter(new TourDetailFormatter());
        registry.addFormatter(new TicketTypeFormatter());
    }
}
