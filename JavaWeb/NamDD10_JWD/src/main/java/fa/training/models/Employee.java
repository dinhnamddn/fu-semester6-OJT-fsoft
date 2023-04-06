package fa.training.models;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Employee {
    private int employeeId;
    private String firstName;
    private String lastName;
    private int gender;
    private LocalDate dateOfBirth;
    private String phone;
    private String address;
    private String departmentName;
    private String remark;
}
