// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.codebattery.mmb.model;

import com.codebattery.mmb.enumed.CourseTypeEnum;
import com.codebattery.mmb.model.Course;
import com.codebattery.mmb.model.CourseDataOnDemand;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CourseDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CourseDataOnDemand: @Component;
    
    private Random CourseDataOnDemand.rnd = new SecureRandom();
    
    private List<Course> CourseDataOnDemand.data;
    
    public Course CourseDataOnDemand.getNewTransientCourse(int index) {
        Course obj = new Course();
        setCourseType(obj, index);
        setDescription(obj, index);
        setListPrice(obj, index);
        setMaxmumCapacity(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void CourseDataOnDemand.setCourseType(Course obj, int index) {
        CourseTypeEnum courseType = CourseTypeEnum.class.getEnumConstants()[0];
        obj.setCourseType(courseType);
    }
    
    public void CourseDataOnDemand.setDescription(Course obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void CourseDataOnDemand.setListPrice(Course obj, int index) {
        BigDecimal listPrice = BigDecimal.valueOf(index);
        obj.setListPrice(listPrice);
    }
    
    public void CourseDataOnDemand.setMaxmumCapacity(Course obj, int index) {
        Date maxmumCapacity = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setMaxmumCapacity(maxmumCapacity);
    }
    
    public void CourseDataOnDemand.setName(Course obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Course CourseDataOnDemand.getSpecificCourse(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Course obj = data.get(index);
        Long id = obj.getId();
        return Course.findCourse(id);
    }
    
    public Course CourseDataOnDemand.getRandomCourse() {
        init();
        Course obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Course.findCourse(id);
    }
    
    public boolean CourseDataOnDemand.modifyCourse(Course obj) {
        return false;
    }
    
    public void CourseDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Course.findCourseEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Course' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Course>();
        for (int i = 0; i < 10; i++) {
            Course obj = getNewTransientCourse(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
