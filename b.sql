SELECT staff.name,`assign_work`.work,report.report FROM staff JOIN assign_work ON 
                staff.lid=assign_work.staff_id JOIN report ON report.work_id=assign_work.staff_id
