package fa.training.models;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Account {
    private int accountId;
    private String account;
    private String email;
    private String password;
    private int status;
    private Employee employee;
}
