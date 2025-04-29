-- Anastasia LaPeruta, 4/29/2025

create or replace function prereqsfor(p_course_num INTEGER) returns setof INTEGER as
$$
begin
  return query
    select prereqnum
      from prerequisites
     where coursenum = p_course_num;
end;
$$ language plpgsql;

create or replace function isprereqfor(p_prereq_num INTEGER) returns setof INTEGER as
$$
begin
  return query
    select coursenum
      from prerequisites
     where prereqnum = p_prereq_num;
end;
$$ language plpgsql;


select * from prereqsfor(499); 
select * from isprereqfor(120); 
