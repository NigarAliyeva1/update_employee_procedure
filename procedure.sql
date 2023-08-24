create or replace procedure update_employee(p_employee_id number,p_increased_commission_pct out number) is
v_commission_pct number;
begin
    select commission_pct into v_commission_pct from employees where employee_id=p_employee_id;
    p_increased_commission_pct:=v_commission_pct+0.2;
    update employees set commission_pct=p_increased_commission_pct  where employee_id=p_employee_id;
    commit;
exception
   
     when no_data_found then
    dbms_output.put_line('Error: Employee not found');
    when others then 
    dbms_output.put_line('An error occurred: ' || SQLERRM); 
end;
