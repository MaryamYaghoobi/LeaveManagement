
package ir.dotin.entity;

import javax.persistence.Entity;
import javax.persistence.*;
import java.util.List;

@Entity(name = "Email")
@Table(name = "t_Email")
public class Email extends ir.dotin.entity.Entity {

    @Column(name = "c_context", columnDefinition = "VARCHAR(255)")
    private String context;

    @Column(name = "c_subject", columnDefinition = "VARCHAR(255)")
    private String subject;

    @OneToMany()
    @JoinTable(name = "mm_EmployeeEmail",
            joinColumns = {@JoinColumn(name = "c_receiveEmailId")},
            inverseJoinColumns = {@JoinColumn(name = "c_receiverId")})
    private List<Employee> receiverEmployees;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }


    public List<Employee> getReceiverEmployees() {
        return receiverEmployees;
    }

    public void setReceiverEmployees(List<Employee> receiverEmployees) {
        this.receiverEmployees = receiverEmployees;
    }


}